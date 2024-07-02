import 'package:json_annotation/json_annotation.dart';

part 'recommended_response.g.dart';

@JsonSerializable()
class RecommendationResponseModel {
  final List<Recommendation> recommendations;

  RecommendationResponseModel({required this.recommendations});

  factory RecommendationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationResponseModelToJson(this);
}

@JsonSerializable()
class Recommendation {
  @JsonKey(name: '_id')
  final String? placeId;
  final int? id;
  final String? name;
  final String? description;
  final String? language;
  final String? image;
  final String? location;
  final double? latitude;
  final double? longitude;
  final Category? category;

  Recommendation(
    this.placeId, {
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.image,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.category,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
