// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditRequestBody _$EditRequestBodyFromJson(Map<String, dynamic> json) =>
    EditRequestBody(
      name: json['name'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'],
      email: json['email'] as String?,
    );

Map<String, dynamic> _$EditRequestBodyToJson(EditRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'avatar': instance.avatar,
      'email': instance.email,
    };
