import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_response.g.dart';

@JsonSerializable()
class ResetResponseModel {
  final String? message;
  final String? status;

  ResetResponseModel(this.status, this.message);

  factory ResetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetResponseModelFromJson(json);
}
