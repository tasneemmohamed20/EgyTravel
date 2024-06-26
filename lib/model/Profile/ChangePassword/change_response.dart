import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_response.g.dart';

@JsonSerializable()
class ChangeResponseModel {
  final String? message;
  final String? status;

  ChangeResponseModel(this.status, this.message);

  factory ChangeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeResponseModelFromJson(json);
}
