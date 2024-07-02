// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponseModel _$PlacesResponseModelFromJson(Map<String, dynamic> json) =>
    PlacesResponseModel(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String?,
      (json['result'] as num?)?.toInt(),
      (json['page'] as num?)?.toInt(),
      (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlacesResponseModelToJson(
        PlacesResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status': instance.status,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['places'] as List<dynamic>?)
          ?.map((e) => PlacesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'places': instance.placesData,
    };

PlacesData _$PlacesDataFromJson(Map<String, dynamic> json) => PlacesData(
      (json['id'] as num?)?.toInt(),
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
      json['_id'] as String,
    );

Map<String, dynamic> _$PlacesDataToJson(PlacesData instance) =>
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
      json['_id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
