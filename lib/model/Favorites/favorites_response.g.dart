// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavResponseModel _$FavResponseModelFromJson(Map<String, dynamic> json) =>
    FavResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FavResponseModelToJson(FavResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['favoritePlaces'] as List<dynamic>?)
          ?.map((e) => FavPlaces.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['favoriteArticles'] as List<dynamic>?)
          ?.map((e) => FavArticles.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['userTrips'] as List<dynamic>?)
          ?.map((e) => Trips.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'favoritePlaces': instance.favoritePlaces,
      'favoriteArticles': instance.favoriteArticles,
      'userTrips': instance.userTrips,
    };

FavPlaces _$FavPlacesFromJson(Map<String, dynamic> json) => FavPlaces(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      json['language'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      json['category'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['_id'] as String?,
    );

Map<String, dynamic> _$FavPlacesToJson(FavPlaces instance) => <String, dynamic>{
      '_id': instance.placeId,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'image': instance.image,
      'location': instance.location,
      'category': instance.category,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

FavArticles _$FavArticlesFromJson(Map<String, dynamic> json) => FavArticles(
      json['_id'] as String?,
      json['title'] as String?,
      json['image'] as String?,
      (json['decription'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FavArticlesToJson(FavArticles instance) =>
    <String, dynamic>{
      '_id': instance.atricleId,
      'title': instance.title,
      'image': instance.image,
      'decription': instance.description,
    };

Trips _$TripsFromJson(Map<String, dynamic> json) => Trips(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      json['category'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['_id'] as String?,
    );

Map<String, dynamic> _$TripsToJson(Trips instance) => <String, dynamic>{
      '_id': instance.placeId,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'category': instance.category,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
