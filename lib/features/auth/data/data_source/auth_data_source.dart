import 'package:dio/dio.dart';
import 'package:elabasy_store/core/services/graphql/api_service.dart';
import 'package:elabasy_store/core/services/graphql/graphql_quaries/auth/auth_queries.dart';
import 'package:elabasy_store/features/auth/data/models/login_request_body.dart';
import 'package:elabasy_store/features/auth/data/models/login_response.dart';
import 'package:elabasy_store/features/auth/data/models/user_role_response.dart';
import 'package:flutter/widgets.dart';

class AuthDataSource {
  const AuthDataSource(this._graphl);
  final ApiService _graphl;
  //login
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response =
        await _graphl.login(AuthQueries().loginMapQuery(body: body));
    return response;
  }

  // User role
  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role ====> ${response.userRole}');
    return response;
  }
}
