// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponseModel _$ArticlesResponseModelFromJson(
        Map<String, dynamic> json) =>
    ArticlesResponseModel(
      json['status'] as String?,
      (json['results'] as num?)?.toInt(),
    )..data = json['data'] == null
        ? null
        : ArtData.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$ArticlesResponseModelToJson(
        ArticlesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

ArtData _$ArtDataFromJson(Map<String, dynamic> json) => ArtData(
      (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtDataToJson(ArtData instance) => <String, dynamic>{
      'articles': instance.articlesData,
    };

ArticlesData _$ArticlesDataFromJson(Map<String, dynamic> json) => ArticlesData(
      json['title'] as String?,
      (json['decription'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['image'] as String?,
      json['_id'] as String?,
    );

Map<String, dynamic> _$ArticlesDataToJson(ArticlesData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'decription': instance.description,
    };
