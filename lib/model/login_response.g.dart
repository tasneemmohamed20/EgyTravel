// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'status': instance.status,
      'data': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['address'] as String?,
      json['favoritePlaces'] as List<dynamic>?,
      json['favoriteArticles'] as List<dynamic>?,
      json['userTrips'] as List<dynamic>?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'favoritePlaces': instance.favoritePlaces,
      'favoriteArticles': instance.favoriteArticles,
      'userTrips': instance.userTrips,
      'avatar': instance.avatar,
    };
