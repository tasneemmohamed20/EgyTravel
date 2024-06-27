import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorites_response.g.dart';

@JsonSerializable()
class FavResponseModel {
  final String? status;
  final Data? data;

  FavResponseModel({this.data, this.status});

  factory FavResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  final List<FavPlaces>? favoritePlaces;
  final List<FavArticles>? favoriteArticles;
  final List<Trips>? userTrips;

  Data(this.favoritePlaces, this.favoriteArticles, this.userTrips);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class FavPlaces {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? description;
  final String? language;
  final String? image;
  final String? location;
  final String? category;
  final double? latitude;
  final double? longitude;

  FavPlaces(this.id, this.name, this.description, this.language, this.image,
      this.location, this.category, this.latitude, this.longitude);

  factory FavPlaces.fromJson(Map<String, dynamic> json) =>
      _$FavPlacesFromJson(json);
}

@JsonSerializable()
class FavArticles {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? image;
  @JsonKey(name: 'decription')
  final List<String>? description;
  FavArticles(this.id, this.title, this.image, this.description);

  factory FavArticles.fromJson(Map<String, dynamic> json) =>
      _$FavArticlesFromJson(json);
}

@JsonSerializable()
class Trips {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final String? location;
  final String? category;
  final double? latitude;
  final double? longitude;

  Trips(this.id, this.name, this.description, this.image, this.location,
      this.category, this.latitude, this.longitude);

  factory Trips.fromJson(Map<String, dynamic> json) => _$TripsFromJson(json);
}
