// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeResponseModel _$ChangeResponseModelFromJson(Map<String, dynamic> json) =>
    ChangeResponseModel(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$ChangeResponseModelToJson(
        ChangeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
