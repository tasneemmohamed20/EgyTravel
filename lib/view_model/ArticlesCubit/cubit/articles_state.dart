import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.initial() = _Initial;

// Articles
  const factory ArticleState.getArticlesloading() = GetArticlesloading;
  const factory ArticleState.getArticlesSuccess(
      ArticlesResponseModel articlesResponseModel) = GetArticlesSuccess;
  const factory ArticleState.getArticlesError(ErrorHandler errorHandler) =
      GetArticlesError;
}
