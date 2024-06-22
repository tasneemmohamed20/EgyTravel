// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetResponseModel _$ResetResponseModelFromJson(Map<String, dynamic> json) =>
    ResetResponseModel(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$ResetResponseModelToJson(ResetResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
