import 'package:bloc/bloc.dart';
import 'package:egy_travel/repositories/recommended_repo.dart';
import 'package:egy_travel/view_model/RecommendedCubit/cubit/recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  final RecommendedRepo _recommendedRepo;
  RecommendedCubit(this._recommendedRepo)
      : super(const RecommendedState.initial());
  void getRecommended(int id) async {
    emit(const RecommendedState
        .getRecommendedloading()); // Indicate initial loading

    final response =
        await _recommendedRepo.getRecommended(id); // Fetch initial page

    response.when(
      success: (recommendedResponseModel) {
        emit(RecommendedState.getRecommendedSuccess(recommendedResponseModel));
      },
      failure: (errorHandler) {
        emit(RecommendedState.getRecommendedError(errorHandler));
      },
    );
  }
}
