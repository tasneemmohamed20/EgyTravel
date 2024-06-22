// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotResponseModel _$ForgotResponseModelFromJson(Map<String, dynamic> json) =>
    ForgotResponseModel(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$ForgotResponseModelToJson(
        ForgotResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
