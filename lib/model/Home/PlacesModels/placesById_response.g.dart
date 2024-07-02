// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placesById_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesByIDResponseModel _$PlacesByIDResponseModelFromJson(
        Map<String, dynamic> json) =>
    PlacesByIDResponseModel(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String?,
    );

Map<String, dynamic> _$PlacesByIDResponseModelToJson(
        PlacesByIDResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['place'] == null
          ? null
          : PlaceData.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'place': instance.placesData,
    };

PlaceData _$PlaceDataFromJson(Map<String, dynamic> json) => PlaceData(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      json['language'] as String?,
      json['image'] as String?,
      json['location'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['_id'] as String?,
      json['isFavorite'] as bool?,
      json['isTrip'] as bool?,
    );

Map<String, dynamic> _$PlaceDataToJson(PlaceData instance) => <String, dynamic>{
      '_id': instance.sId,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'image': instance.image,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isFavorite': instance.isFavorite,
      'isTrip': instance.isTrip,
    };
