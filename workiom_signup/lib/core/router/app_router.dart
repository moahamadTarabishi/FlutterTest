import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/di/injection.dart';
import 'package:workiom_signup/features/auth/presentation/login/login_page.dart';
import 'package:workiom_signup/features/auth/presentation/personal_info/personal_info_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_email_password_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_success_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_tenant_name_page.dart';
import 'package:workiom_signup/features/auth/presentation/splash/splash_page.dart';
import 'package:workiom_signup/features/auth/presentation/welcome/welcome_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (_, __) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    ),
    // ShellRoute: same SignUpBloc instance across all /signup/* children.
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (_) => getIt<SignUpBloc>()..add(const SignUpEvent.started()),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/signup/email-password',
          builder: (_, __) => const SignUpEmailPasswordPage(),
        ),
        GoRoute(
          path: '/signup/tenant-name',
          builder: (_, __) => const SignUpTenantNamePage(),
        ),
        GoRoute(
          path: '/signup/personal-info',
          builder: (_, __) => const PersonalInfoPage(),
        ),
        GoRoute(
          path: '/signup/success',
          builder: (_, __) => const SignUpSuccessPage(),
        ),
      ],
    ),
  ],
);
