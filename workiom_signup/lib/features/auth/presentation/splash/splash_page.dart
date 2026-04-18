import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/di/injection.dart';
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
    _boot();
  }

  Future<void> _boot() async {
    final result = await getIt<GetCurrentSession>()();
    if (!mounted) return;

    result.fold(
      (_) => context.go('/welcome'),
      (session) {
        if (session?.user != null) {
          context.go('/signup/success');
        } else {
          context.go('/welcome');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.primary,
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
