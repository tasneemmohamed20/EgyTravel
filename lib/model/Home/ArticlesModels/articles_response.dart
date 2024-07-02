import 'package:freezed_annotation/freezed_annotation.dart';
part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponseModel {
  final String? status;
  final int? results;
  ArtData? data;
  ArticlesResponseModel(this.status, this.results);

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseModelFromJson(json);
}

@JsonSerializable()
class ArtData {
  @JsonKey(name: 'articles')
  final List<ArticlesData>? articlesData;

  ArtData(this.articlesData);

  factory ArtData.fromJson(Map<String, dynamic> json) =>
      _$ArtDataFromJson(json);
}

@JsonSerializable()
class ArticlesData {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? image;
  @JsonKey(name: 'decription')
  final List<String>? description;

  ArticlesData(this.title, this.description, this.image, this.id);
  factory ArticlesData.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDataFromJson(json);
}
