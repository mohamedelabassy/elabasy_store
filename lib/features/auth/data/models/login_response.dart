// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse(this.data);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json); // اسم الدالة يجب أن يكون LoginResponse
  LoginDataModel data;
}

@JsonSerializable()
class LoginDataModel {
  LoginModel login;
  LoginDataModel(this.login);
  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json); // اسم الدالة يجب أن يكون LoginDataModel
}

@JsonSerializable()
class LoginModel {
  LoginModel({
    this.accessToken,
    this.refreshToken,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json); // هذا صحيح
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
}
