import 'package:freezed_annotation/freezed_annotation.dart';
part 'placesById_response.g.dart';

@JsonSerializable()
class PlacesByIDResponseModel {
  final String? status;
  Data? data;

  PlacesByIDResponseModel(
    this.data,
    this.status,
  );

  factory PlacesByIDResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlacesByIDResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'place')
  PlaceData? placesData;

  Data(this.placesData);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class PlaceData {
  @JsonKey(name: '_id')
  final String? sId;
  final int? id;
  final String? name;
  final String? description;
  final String? language;
  final String? image;
  final String? location;
  final double? latitude;
  final double? longitude;
  final bool? isFavorite;
  final bool? isTrip;
  PlaceData(
      this.id,
      this.name,
      this.description,
      this.language,
      this.image,
      this.location,
      this.latitude,
      this.longitude,
      this.sId,
      this.isFavorite,
      this.isTrip);
  factory PlaceData.fromJson(Map<String, dynamic> json) =>
      _$PlaceDataFromJson(json);
}
