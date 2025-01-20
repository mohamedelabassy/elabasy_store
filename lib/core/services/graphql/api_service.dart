import 'package:dio/dio.dart';
import 'package:elabasy_store/features/auth/data/models/login_response.dart';
import 'package:elabasy_store/features/auth/data/models/user_role_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );
  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();
}
