import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_response.g.dart';

@JsonSerializable()
class DeleteResponseModel {
  final String? message;
  final String? status;

  DeleteResponseModel(this.status, this.message);

  factory DeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteResponseModelFromJson(json);
}
