import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/di/injection.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/core/widgets/app_theme_switcher.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/presentation/login/bloc/sign_in_bloc.dart';

class SignInSuccessPage extends StatefulWidget {
  const SignInSuccessPage({super.key});

  @override
  State<SignInSuccessPage> createState() => _SignInSuccessPageState();
}

class _SignInSuccessPageState extends State<SignInSuccessPage> {
  UserSession? _session;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final stateSession = context.read<SignInBloc>().state.userSession;
      if (stateSession != null) {
        setState(() => _session = stateSession);
      } else {
        unawaited(_loadSession());
      }
    });
  }

  Future<void> _loadSession() async {
    final result = await getIt<GetCurrentSession>()();
    if (!mounted) return;
    result.fold(
      (_) {},
      (s) => setState(() => _session = s),
    );
  }

  Future<void> _handleLogout() async {
    await getIt<SecureStorage>().clearAuthToken();
    if (!mounted) return;
    context.read<SignInBloc>().add(const SignInEvent.reset());
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final user = _session?.user;
    final tenant = _session?.tenant;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          AppThemeSwitcher(),
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 56),
                    AppIcon(
                      Assets.icons.icWorkiom,
                      size: 48,
                      color: cs.primary,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.welcomeBack,
                      style: tt.headlineMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.signInSuccessSubtitle,
                      style: tt.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    if (user != null) ...[
                      const SizedBox(height: 36),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: sem.strengthTrack,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: cs.outline),
                        ),
                        child: Column(
                          children: [
                            _CardRow(
                              label: l10n.nameLabel,
                              value: '${user.name} ${user.surname}'.trim(),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: cs.outline,
                            ),
                            _CardRow(
                              label: l10n.emailLabel,
                              value: user.emailAddress,
                            ),
                            if (tenant != null) ...[
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: cs.outline,
                              ),
                              _CardRow(
                                label: l10n.successWorkspace,
                                value: tenant.name,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: cs.outline,
                              ),
                              _CardRow(
                                label: l10n.workspaceLabel,
                                value: l10n.tenantAvailableHint(
                                  tenant.tenancyName,
                                ),
                                valueColor: cs.primary,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _handleLogout,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: cs.outline),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: tt.labelLarge,
                        foregroundColor: cs.onSurface,
                      ),
                      child: Text(l10n.logout),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const AppFooter(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              style: tt.labelLarge?.copyWith(
                color: valueColor ?? cs.onSurface,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
