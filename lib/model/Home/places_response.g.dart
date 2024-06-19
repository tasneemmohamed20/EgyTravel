// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponseModel _$PlacesResponseModelFromJson(Map<String, dynamic> json) =>
    PlacesResponseModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : PlacesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['result'] as String?,
      json['page'] as String?,
      json['totalPages'] as String?,
    );

Map<String, dynamic> _$PlacesResponseModelToJson(
        PlacesResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'data': instance.placesData,
    };

PlacesData _$PlacesDataFromJson(Map<String, dynamic> json) => PlacesData(
      json['id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['language'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlacesDataToJson(PlacesData instance) =>
    <String, dynamic>{
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
      json['_id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
