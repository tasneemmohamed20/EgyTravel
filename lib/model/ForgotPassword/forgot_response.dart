import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_response.g.dart';

@JsonSerializable()
class ForgotResponseModel {
  final String? message;
  final String? status;

  ForgotResponseModel(this.status, this.message);

  factory ForgotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotResponseModelFromJson(json);
}
