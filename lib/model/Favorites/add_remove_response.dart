import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_remove_response.g.dart';

@JsonSerializable()
class AddRemoveResponseModel {
  final String? status;

  AddRemoveResponseModel(
    this.status,
  );

  factory AddRemoveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddRemoveResponseModelFromJson(json);
}
