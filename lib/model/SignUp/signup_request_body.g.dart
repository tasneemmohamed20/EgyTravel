// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
    );

Map<String, dynamic> _$SignUpRequestBodyToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'address': instance.address,
      'passwordConfirm': instance.passwordConfirm,
    };
