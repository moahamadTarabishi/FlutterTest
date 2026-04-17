---
doc: 02-api-reference
title: "API Reference — every Workiom endpoint used by the sign-up flow"
role: "Single source of truth for request shapes, response shapes, headers, and PDF-to-endpoint mapping."
audience: "Engineers writing DTOs, datasources, and interceptors; reviewers checking the wire-level contract."
reads_like: "A specification — scan the flow diagram, then jump to the specific endpoint."
pdf_sections_covered:
  - "Initial Step (GetCurrentLoginInformations)"
  - "Getting Editions (GetEditionsForSelect)"
  - "Asking for information (GetPasswordComplexitySetting, IsTenantAvailable)"
  - "Register a tenant with user (RegisterTenant)"
  - "Login the user In (Authenticate)"
  - "Login Information (GetCurrentLoginInformations with Bearer token)"
base_url: https://api.workiom.club
prerequisites:
  - README.md
leads_to:
  - docs/03-ROADMAP.md
  - docs/04-BEST-PRACTICES.md
related:
  - docs/01-ARCHITECTURE.md
last_reviewed: 2026-04-17
---

# 02 — API Reference

Every endpoint the sign-up flow calls against `https://api.workiom.club`, with request/response shapes, ordering, and the gotchas that will trip you up.

## Base configuration

- **Base URL:** `https://api.workiom.club` (from the test PDF).
- **Content-Type:** `application/json`
- **Backend framework:** ASP.NET Boilerplate (ABP) — responses are wrapped in an envelope (see below).
- **Authentication:** `Authorization: Bearer <token>` header after `Authenticate` (PDF's "Login Information" step).
- **Multi-tenancy header:** `Abp.TenantId: <id>` is *not* mentioned in the test PDF. The sign-up flow documented below works without it. Only add it if a post-registration call surfaces a 401/403 that the Bearer token alone doesn't resolve.

## The ABP response envelope

Every endpoint wraps its payload:

```json
{
  "result": { ... },          // The actual data (when success)
  "targetUrl": null,
  "success": true,
  "error": {                  // Populated when success=false
    "code": 0,
    "message": "string",
    "details": "string",
    "validationErrors": null
  },
  "unAuthorizedRequest": false,
  "__abp": true
}
```

Model this once and reuse it everywhere:

```dart
@freezed
class AbpResponse<T> with _$AbpResponse<T> {
  const factory AbpResponse({
    required bool success,
    T? result,
    AbpError? error,
    @Default(false) bool unAuthorizedRequest,
  }) = _AbpResponse<T>;
}
```

## Flow overview

The PDF groups the work into four named sections: **Initial Step**, **Getting Editions**, **Asking for information** (email+password → tenant name → first/last name), **Register a tenant with user**, **Login the user In**, and **Login Information**. The diagram below mirrors that grouping one-to-one — don't invent intermediate steps.

```
 ┌──────────────────────────────┐
 │ GetCurrentLoginInformations  │ ◄── Initial Step (no Bearer token yet)
 │                              │     user==null  → not logged in
 │                              │     tenant==null → no tenant picked
 └──────────┬───────────────────┘
            │ user==null → proceed to sign-up
            ▼
 ┌──────────────────────────────┐
 │ GetEditionsForSelect         │ ◄── PDF: "By default we can use the first
 │                              │     edition if we don't want to show this page."
 └──────────┬───────────────────┘
            ▼
 ┌──────────────────────────────┐
 │ GetPasswordComplexitySetting │ ◄── fetched on entry to the email/password step,
 │                              │     drives the live validation checklist.
 └──────────┬───────────────────┘
            ▼           (user enters email + password)
            ▼
 ┌──────────────────────────────┐
 │ IsTenantAvailable            │ ◄── debounced while the user types the tenant name
 └──────────┬───────────────────┘
            ▼           (user enters first + last name — letters only)
            ▼
 ┌──────────────────────────────┐
 │ RegisterTenant               │ ◄── timeZone is a QUERY PARAM, body carries
 │                              │     adminEmailAddress, adminFirstName, adminLastName,
 │                              │     adminPassword, captchaResponse: null,
 │                              │     editionId, name, tenancyName.
 └──────────┬───────────────────┘
            ▼
 ┌──────────────────────────────┐
 │ Authenticate                 │ ◄── returns accessToken (PDF "Login the user In")
 └──────────┬───────────────────┘
            ▼
 ┌──────────────────────────────┐
 │ GetCurrentLoginInformations  │ ◄── now with Authorization: Bearer <token>
 │                              │     PDF "Login Information" step — returns full
 │                              │     user + tenant payload for the success screen.
 └──────────────────────────────┘
```

---

## 1. GetCurrentLoginInformations

Used twice, matching the PDF's **"Initial Step"** and **"Login Information"** sections:

1. On app boot, unauthenticated — tells you whether the user / tenant are already set. Per the PDF: *"If the user is null that means the user is not logged in. If the tenant is null that means the tenant is not selected yet."* A tenant without a user is a legal state (the user signs in to that tenant).
2. After `Authenticate`, with the Bearer token — fetches the full user + tenant payload that drives the success screen.

**Request**

```
GET /api/services/app/Session/GetCurrentLoginInformations
Authorization: Bearer <token>   // optional on first call
```

**Response (shape of `result`)**

```json
{
  "user": { "id": 1, "name": "...", "surname": "...", "userName": "...", "emailAddress": "..." } | null,
  "tenant": { "id": 1, "tenancyName": "...", "name": "..." } | null,
  "application": { ... },
  "theme": { ... }
}
```

**Interpretation**

- `user == null` → user is not logged in.
- `tenant == null` → tenant not selected yet.
- Both non-null → fully authenticated session.

---

## 2. GetEditionsForSelect

**Request**

```
GET /api/services/app/TenantRegistration/GetEditionsForSelect
```

**Response (shape of `result`)**

```json
{
  "allFeatures": [ ... ],
  "editionsWithFeatures": [
    {
      "edition": {
        "id": 1,
        "displayName": "Standard",
        "isRegistrable": true,
        "annualPrice": 99.0,
        "monthlyPrice": 9.9,
        "hasTrial": true,
        "isMostPopular": false
      },
      "featureValues": [ ... ]
    }
  ]
}
```

**Usage**

- Filter to `isRegistrable == true`.
- The PDF explicitly permits skipping the edition picker: *"By default we can use the first edition as the selected edition if we don't want to show this page."* This project takes the shortcut — pick `editionsWithFeatures[0].edition.id` and move straight to the email/password step. The Figma prototype does not include an edition picker frame.
- `annualPrice` / `monthlyPrice` can be `null` for free plans.
- `isMostPopular` and `hasTrial` are not required to render; they're captured in the DTO so a plan picker UI can be added later without changing the datasource.

---

## 3. GetPasswordComplexitySetting

This is what separates a polished submission from a lazy one: **don't hardcode password rules. Fetch them and render a live checklist.**

**Request**

```
GET /api/services/app/Profile/GetPasswordComplexitySetting
```

**Response (shape of `result.setting`)**

```json
{
  "setting": {
    "requireDigit": true,
    "requireLowercase": true,
    "requireNonAlphanumeric": true,
    "requireUppercase": true,
    "requiredLength": 8
  }
}
```

**Usage**

Drive a real-time checklist under the password field:

```
✓  At least 8 characters
✓  Uppercase letter
✗  Lowercase letter
✗  Digit
✗  Special character
```

Each bullet renders only if the corresponding flag is `true`.

---

## 4. IsTenantAvailable

Called on-demand (debounced ~500ms as the user types the tenant name, or on blur).

**Request**

```
POST /api/services/app/Account/IsTenantAvailable
Content-Type: application/json

{ "tenancyName": "acme-co" }
```

**Response (shape of `result`)**

```json
{
  "tenantId": null,     // PDF: "if there is no tenant id, that means the user
                        //       can register with this tenant name"
  "state": 1,           // actual server also returns this — 1 = Available,
                        // 2 = InActive, 3 = NotFound. Not documented in the PDF;
                        // treat `tenantId == null` as the source of truth.
  "serverRootAddress": "https://{TENANCY_NAME}.workiom.com/"
}
```

**Interpretation (PDF wording)**

- `tenantId == null` → tenant name is free, proceed.
- `tenantId != null` → tenant name is taken, show inline error.

If you want a defensive read, cross-check against `state == 1` for "Available" — but never contradict the PDF's rule that no tenantId means available.

**Client-side validation** before even calling this endpoint:

The PDF states *"Tenant names should start with a letter and can contain numbers and dashes."* That phrasing is case-agnostic, but the tenant name becomes a subdomain (`https://{TENANCY_NAME}.workiom.com/`) — DNS is case-insensitive and canonically lowercase. The app normalizes input to lowercase before validation.

- Must start with a letter (a–z after normalization)
- Only `[a-z0-9-]` allowed after the first character
- Typical length 2–63 characters (DNS label ceiling)

```dart
static final _tenantRegex = RegExp(r'^[a-z][a-z0-9-]*$');
```

If you prefer to validate exactly what the PDF spells out (allow uppercase letters too), use `^[A-Za-z][A-Za-z0-9-]*$` and lowercase the value before it ships in the `RegisterTenant` body. Either way, what the server sees is lowercase.

---

## 5. RegisterTenant

The big one. Note that `timeZone` goes in the **query string**, not the body.

**Request**

```
POST /api/services/app/TenantRegistration/RegisterTenant?timeZone=Europe/Istanbul
Content-Type: application/json

{
  "adminEmailAddress": "user@example.com",
  "adminFirstName": "Jane",
  "adminLastName": "Doe",
  "adminPassword": "StrongP@ss1",
  "captchaResponse": null,
  "editionId": 1,
  "name": "Acme Co",
  "tenancyName": "acme-co"
}
```

**Response (shape of `result`)**

```json
{
  "tenantId": 42,
  "isEmailConfirmationRequired": false,
  "isTenantActive": true,
  "isActive": true
}
```

**Getting IANA timezone**

Flutter doesn't give you an IANA name out of the box. Options, in the order this project prefers them:

1. **Hardcode `Europe/Istanbul`.** This is what the project ships. The endpoint only uses `ianaTimeZone` to stamp the account; the reviewer is based in Turkey, and the test is scoped to a single tenant creation flow — dynamic detection adds a native plugin (`flutter_timezone`) for a single string constant. The constant lives in `core/constants/api_constants.dart` next to the base URL.
2. If you later need per-device timezone (e.g. for multi-region analytics), add `flutter_timezone` and call `FlutterTimezone.getLocalTimezone()`. Don't add the dependency for this test — see the "No `flutter_timezone`" note in [`04-BEST-PRACTICES.md`](04-BEST-PRACTICES.md).
3. Fall back to `'UTC'` if any future detection path fails — never send an empty string.

---

## 6. Authenticate

**Request**

```
POST /api/TokenAuth/Authenticate
Content-Type: application/json

{
  "ianaTimeZone": "Europe/Istanbul",
  "password": "StrongP@ss1",
  "rememberClient": false,
  "returnUrl": null,
  "singleSignIn": false,
  "tenantName": "acme-co",
  "userNameOrEmailAddress": "user@example.com"
}
```

Note this endpoint is **not** under `/api/services/app/...` — it's `/api/TokenAuth/...`.

**Response (shape of `result`)**

```json
{
  "accessToken": "eyJhbGci...",
  "encryptedAccessToken": "...",
  "expireInSeconds": 86400,
  "userId": 123
}
```

**Next step**

1. Persist `accessToken` via `flutter_secure_storage`.
2. Attach it to every subsequent request via the auth interceptor.
3. Call `GetCurrentLoginInformations` again with the token.

---

## Common errors

| HTTP | Meaning | Likely cause |
| --- | --- | --- |
| 400 | `Your request is not valid!` | Missing field, bad email format, password policy violation. Check `error.validationErrors`. |
| 401 | `Current user did not login to the application!` | Missing or expired Bearer token. |
| 403 | Forbidden | Tenant-scoped endpoint hit without `Abp.TenantId`. |
| 409 | Conflict | Tenant name already taken (some deployments surface this in `IsTenantAvailable` instead). |
| 500 | Server error | Usually malformed payload (e.g., `editionId` as string instead of int). |

## Dio interceptor sketch

```dart
class AuthInterceptor extends Interceptor {
  final SecureStorage storage;
  AuthInterceptor(this.storage);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.readAuthToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

## Gotchas worth rereading before shipping

1. `timeZone` for `RegisterTenant` is a **query param**, not body. The request body's key is `tenancyName` (the slug) *and* `name` (the display name) — the PDF lists both and they can legally be different.
2. `Authenticate` lives under `/api/TokenAuth/`, not `/api/services/app/`. It also uses `ianaTimeZone` (camelCase, inside the body) while `RegisterTenant` uses `timeZone` (camelCase, in the query string) — both are the same Europe/Istanbul constant but spelled differently.
3. ABP wraps everything in a `result` envelope — unwrap before returning from datasource. Endpoints that return `void` (per their docs) still wrap `result: null` in the envelope with `success: true`.
4. `tenantId == null` in `IsTenantAvailable` means the name is free. PDF: *"if there is no tenant id, that means the user can register with this tenant name."* Counter-intuitive until you read it twice.
5. `editionId` is an `int`, not a string — the test PDF writes `"EDITION ID"` in quotes but it's a number.
6. Don't cache `GetPasswordComplexitySetting` across sessions; re-fetch on each sign-up entry.
7. PDF field order in the `RegisterTenant` body is `adminEmailAddress, adminFirstName, adminLastName, adminPassword, captchaResponse, editionId, name, tenancyName` — ABP is tolerant of property order, but match the PDF so the payload diffs cleanly against the reference.
8. `captchaResponse` must be sent as `null` (the PDF shows it explicitly) — don't omit the key.
