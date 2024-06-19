import 'package:freezed_annotation/freezed_annotation.dart';
part 'places_response.g.dart';

@JsonSerializable()
class PlacesResponseModel {
  final String? result;
  final String? status;
  final String? page;
  final String? totalPages;
  @JsonKey(name: 'data')
  List<PlacesData?>? placesData;

  PlacesResponseModel(
    this.placesData,
    this.status,
    this.result,
    this.page,
    this.totalPages,
  );

  factory PlacesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseModelFromJson(json);
}

@JsonSerializable()
class PlacesData {
  final String? id;
  final String? name;
  final String? description;
  final String? language;
  final String? image;
  final String? location;
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'category')
  final Category? category;

  PlacesData(this.id, this.name, this.description, this.language, this.image,
      this.location, this.latitude, this.longitude, this.category);
  factory PlacesData.fromJson(Map<String, dynamic> json) =>
      _$PlacesDataFromJson(json);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
