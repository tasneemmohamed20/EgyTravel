import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/Favorites/favorites_response.dart';
import 'package:egy_travel/repositories/favorites_repo.dart';
import 'package:egy_travel/view_model/FavCubit/cubit/favorites_state.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo _favRepo;
  FavCubit(this._favRepo) : super(const FavState.initial());

  void getFavorites() async {
    emit(const FavState.favloading());
    final response = await _favRepo.favorites();
    response.when(success: (FavResponseModel favResponseModel) {
      emit(FavState.favSuccess(favResponseModel));
    }, failure: (errorHandler) {
      emit(FavState.favError(errorHandler));
    });
  }
}
