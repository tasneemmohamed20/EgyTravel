// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetRequestBody _$ResetRequestBodyFromJson(Map<String, dynamic> json) =>
    ResetRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      otp: json['frogetCode'] as String,
    );

Map<String, dynamic> _$ResetRequestBodyToJson(ResetRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'frogetCode': instance.otp,
    };
