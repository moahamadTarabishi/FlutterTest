import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/di/injection.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/features/auth/presentation/login/login_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_email_password_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_success_page.dart';
import 'package:workiom_signup/features/auth/presentation/signup/signup_workspace_page.dart';
import 'package:workiom_signup/features/auth/presentation/splash/splash_page.dart';
import 'package:workiom_signup/features/auth/presentation/welcome/welcome_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (_, _) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      builder: (_, _) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, _) => const LoginPage(),
    ),
    // ShellRoute: same SignUpBloc instance across all /signup/* children.
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (_) => getIt<SignUpBloc>()..add(const SignUpEvent.started()),
        child: child,
      ),
      routes: [
        GoRoute(
          path: AppRoutes.signupEmailPassword,
          builder: (_, _) => const SignUpEmailPasswordPage(),
        ),
        GoRoute(
          path: AppRoutes.signupWorkspace,
          builder: (_, _) => const SignUpWorkspacePage(),
        ),
        GoRoute(
          path: AppRoutes.signupSuccess,
          builder: (_, _) => const SignUpSuccessPage(),
        ),
      ],
    ),
  ],
);
