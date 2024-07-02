// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesByIDResponseModel _$ArticlesByIDResponseModelFromJson(
        Map<String, dynamic> json) =>
    ArticlesByIDResponseModel(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as String?,
    );

Map<String, dynamic> _$ArticlesByIDResponseModelToJson(
        ArticlesByIDResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['article'] == null
          ? null
          : ArticlesData.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'article': instance.articlesData,
    };

ArticlesData _$ArticlesDataFromJson(Map<String, dynamic> json) => ArticlesData(
      json['_id'] as String?,
      json['title'] as String?,
      (json['decription'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['image'] as String?,
      json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$ArticlesDataToJson(ArticlesData instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'decription': instance.decription,
      'image': instance.image,
      'isFavorite': instance.isFavorite,
    };
