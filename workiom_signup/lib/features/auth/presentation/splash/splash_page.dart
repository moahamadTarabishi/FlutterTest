import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/di/injection.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    unawaited(_boot());
  }

  Future<void> _boot() async {
    final result = await getIt<GetCurrentSession>()();
    if (!mounted) return;

    result.fold(
      (_) => context.go(AppRoutes.login),
      (session) {
        if (session?.user != null) {
          context.go(AppRoutes.signInSuccess);
        } else {
          context.go(AppRoutes.login);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'workiom',
                      style: tt.headlineMedium?.copyWith(
                        letterSpacing: -0.5,
                        color: cs.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: cs.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AppFooter(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
