import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;
  final String companyName;

  LoginRequest(
      {required this.username,
      required this.password,
      required this.companyName});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
