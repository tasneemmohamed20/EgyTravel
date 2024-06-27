// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String?,
    );

Map<String, dynamic> _$SearchResponseModelToJson(
        SearchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
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
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['language'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      json['category'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlacesDataToJson(PlacesData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'image': instance.image,
      'location': instance.location,
      'category': instance.category,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
