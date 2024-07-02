import 'package:freezed_annotation/freezed_annotation.dart';
part 'art_add_remove_response.g.dart';

@JsonSerializable()
class ArtAddRemoveResponseModel {
  final String? status;

  ArtAddRemoveResponseModel(
    this.status,
  );

  factory ArtAddRemoveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtAddRemoveResponseModelFromJson(json);
}
