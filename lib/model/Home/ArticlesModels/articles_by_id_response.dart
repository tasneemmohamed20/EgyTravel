import 'package:freezed_annotation/freezed_annotation.dart';
part 'articles_by_id_response.g.dart';

@JsonSerializable()
class ArticlesByIDResponseModel {
  final String? status;
  Data? data;

  ArticlesByIDResponseModel(
    this.data,
    this.status,
  );

  factory ArticlesByIDResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesByIDResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'article')
  ArticlesData? articlesData;

  Data(this.articlesData);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class ArticlesData {
  @JsonKey(name: '_id')
  final String? sId;
  final String? title;
  final List<String>? decription;
  final String? image;
  final bool? isFavorite;

  ArticlesData(
      this.sId, this.title, this.decription, this.image, this.isFavorite);
  factory ArticlesData.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDataFromJson(json);
}
