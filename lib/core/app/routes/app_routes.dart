import 'package:elabasy_store/core/app/routes/base_routes.dart';
import 'package:elabasy_store/core/common/under_build_screen.dart';
import 'package:elabasy_store/features/auth/presentation/refactors/sign_up_body.dart';
import 'package:elabasy_store/features/auth/presentation/screens/login_screen.dart';
import 'package:elabasy_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static Route<void> oneGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      case signup:
        return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
