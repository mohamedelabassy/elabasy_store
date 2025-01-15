import 'package:elabasy_store/core/app/routes/base_routes.dart';
import 'package:elabasy_store/core/common/under_build_screen.dart';
import 'package:elabasy_store/test_one_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String testOne = "testOne";
  static const String testTwo = "testTwo";
  static Route<void> oneGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoute(page: const TestOneScreen());
      case testTwo:
        return BaseRoute(page: const TestOneScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
