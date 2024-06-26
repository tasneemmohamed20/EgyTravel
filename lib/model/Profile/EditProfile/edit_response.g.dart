// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditResponseModel _$EditResponseModelFromJson(Map<String, dynamic> json) =>
    EditResponseModel(
      json['status'] as String?,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditResponseModelToJson(EditResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
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
      'address': instance.address,
      'favoritePlaces': instance.favoritePlaces,
      'favoriteArticles': instance.favoriteArticles,
      'userTrips': instance.userTrips,
      'avatar': instance.avatar,
    };
