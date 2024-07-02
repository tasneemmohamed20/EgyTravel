import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';
import 'package:egy_travel/repositories/articles_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticleState> {
  final ArticlesRepo _articlesRepo;
  ArticlesCubit(this._articlesRepo) : super(const ArticleState.initial());

  void getAllArticles() async {
    emit(const ArticleState.getArticlesloading());
    final response = await _articlesRepo.getAllArticles();
    response.when(
      success: (ArticlesResponseModel articlesResponseModel) {
        emit(ArticleState.getArticlesSuccess(articlesResponseModel));
      },
      failure: (errorHandler) {
        emit(ArticleState.getArticlesError(errorHandler));
      },
    );
  }
}
