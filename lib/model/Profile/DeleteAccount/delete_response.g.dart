// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteResponseModel _$DeleteResponseModelFromJson(Map<String, dynamic> json) =>
    DeleteResponseModel(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$DeleteResponseModelToJson(
        DeleteResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
