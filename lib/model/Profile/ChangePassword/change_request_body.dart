import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_request_body.g.dart';

@JsonSerializable()
class ChangeRequestBody {
  String currentPassword;
  String confirmPassword;
  String newPassword;

  ChangeRequestBody(
      {required this.currentPassword,
      required this.confirmPassword,
      required this.newPassword});
  Map<String, dynamic> toJson() => _$ChangeRequestBodyToJson(this);
}
