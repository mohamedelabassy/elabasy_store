import 'package:elabasy_store/core/app/cubit/app_cubit.dart';
import 'package:elabasy_store/core/di/injecttion_container.dart';
import 'package:elabasy_store/core/routes/base_routes.dart';
import 'package:elabasy_store/core/common/under_build_screen.dart';
import 'package:elabasy_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elabasy_store/features/auth/presentation/screens/login_screen.dart';
import 'package:elabasy_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static Route<void> oneGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const LoginScreen(),
        ));
      case signup:
        return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
