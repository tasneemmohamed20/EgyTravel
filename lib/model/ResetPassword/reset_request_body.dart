import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_request_body.g.dart';

@JsonSerializable()
class ResetRequestBody {
  String email;
  String password;
  String passwordConfirm;
  @JsonKey(name: 'frogetCode')
  String otp;
  ResetRequestBody(
      {required this.email,
      required this.password,
      required this.passwordConfirm,
      required this.otp});
  Map<String, dynamic> toJson() => _$ResetRequestBodyToJson(this);
}
