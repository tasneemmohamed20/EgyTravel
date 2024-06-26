// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeRequestBody _$ChangeRequestBodyFromJson(Map<String, dynamic> json) =>
    ChangeRequestBody(
      currentPassword: json['currentPassword'] as String,
      confirmPassword: json['confirmPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangeRequestBodyToJson(ChangeRequestBody instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'confirmPassword': instance.confirmPassword,
      'newPassword': instance.newPassword,
    };
