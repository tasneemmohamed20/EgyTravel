import 'package:bloc/bloc.dart';
import 'package:egy_travel/repositories/articles_by_id_repo.dart';
import 'package:egy_travel/view_model/AreticlesById/cubit/articles_by_id_state.dart';

class ArticleByIdCubit extends Cubit<ArticleByIdState> {
  final ArticlesByIdRepo _articleByIdRepo;

  ArticleByIdCubit(this._articleByIdRepo) : super(const ArticleByIdState.initial());
  Future<void> getArticleById(String id) async {
    emit(const ArticleByIdState.loading());
    final result = await _articleByIdRepo.getArticlesById(id);
    result.when(
      success: (articleByIdResponse) =>
          emit(ArticleByIdState.success(articleByIdResponse)),
      failure: (error) => emit(
          ArticleByIdState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

  getPlaceById(String id) {}
}
