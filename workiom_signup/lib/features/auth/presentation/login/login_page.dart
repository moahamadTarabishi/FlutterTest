import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppIcon(
            Assets.icons.icChevronLeft,
            color: cs.primary,
            matchTextDirection: true,
          ),
          onPressed: () => context.go(AppRoutes.welcome),
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(l10n.signIn, style: tt.headlineMedium),
              const Spacer(),
              Center(
                child: Text(
                  l10n.loginOutOfScope,
                  style: tt.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              const Center(child: AppFooter()),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
