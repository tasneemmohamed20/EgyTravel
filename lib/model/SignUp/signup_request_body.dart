import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  String email;
  String password;
  String name;
  String address;
  String passwordConfirmation;

  SignUpRequestBody(
      {required this.email,
      required this.password,
      required this.name,
      required this.address,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
