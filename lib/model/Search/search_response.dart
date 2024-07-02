import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchResponseModel {
  final String? status;
  final Data? data;

  SearchResponseModel(this.data, this.status);

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'places')
  final List<PlacesData>? placesData;

  Data(this.placesData);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class PlacesData {
  @JsonKey(name: '_id')
  final String? placeId;
  final int? id;
  final String? name;
  final String? description;
  final String? language;
  final String? image;
  final String? location;
  final String? category;
  final double? latitude;
  final double? longitude;

  PlacesData(this.id, this.name, this.description, this.language, this.image,
      this.location, this.category, this.latitude, this.longitude, this.placeId);

  factory PlacesData.fromJson(Map<String, dynamic> json) =>
      _$PlacesDataFromJson(json);
}
