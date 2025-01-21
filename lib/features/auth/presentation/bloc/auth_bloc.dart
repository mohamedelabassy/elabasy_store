import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:elabasy_store/core/services/shared_pref/pref_keys.dart';
import 'package:elabasy_store/core/services/shared_pref/shared_pref.dart';
import 'package:elabasy_store/features/auth/data/models/login_request_body.dart';
import 'package:elabasy_store/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repos) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _repos;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(
      const AuthState.loading(),
    );
    final result = await _repos.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    await result.when(success: (loginData) async {
      // user token
      final token = loginData.data.login.accessToken ?? '';
      //save token in shared
      await SharedPref().setString(PrefKeys.accessToken, token);
      // get user role
      final user = await _repos.userRole(token);
      await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
      emit(AuthState.success(userRole: user.userRole ?? ''));
    }, failure: (error) {
      emit(AuthState.error(error: error));
    });
  }
}
