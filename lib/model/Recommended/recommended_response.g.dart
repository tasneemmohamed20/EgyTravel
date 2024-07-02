// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationResponseModel _$RecommendationResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecommendationResponseModel(
      recommendations: (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendationResponseModelToJson(
        RecommendationResponseModel instance) =>
    <String, dynamic>{
      'recommendations': instance.recommendations,
    };

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      json['_id'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      image: json['image'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      '_id': instance.placeId,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'image': instance.image,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
