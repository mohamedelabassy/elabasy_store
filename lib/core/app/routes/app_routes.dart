import 'package:elabasy_store/core/app/routes/base_routes.dart';
import 'package:elabasy_store/core/common/under_build_screen.dart';
import 'package:elabasy_store/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = 'login';
  static const String testTwo = "testTwo";
  static Route<void> oneGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
