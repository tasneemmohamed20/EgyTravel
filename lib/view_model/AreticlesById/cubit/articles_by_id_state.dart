import 'package:egy_travel/model/Home/ArticlesModels/articles_by_id_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'articles_by_id_state.freezed.dart';

@freezed
class ArticleByIdState with _$ArticleByIdState {
  const factory ArticleByIdState.initial() = _Initial;
  const factory ArticleByIdState.loading() = ArtLoading;
  const factory ArticleByIdState.success(ArticlesByIDResponseModel data) =
      ArtSuccess;
  const factory ArticleByIdState.error({required String message}) = ArtError;
}
