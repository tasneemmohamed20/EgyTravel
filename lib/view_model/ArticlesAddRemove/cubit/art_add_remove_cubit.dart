import 'package:egy_travel/repositories/article_add_remove_repo.dart';
import 'package:egy_travel/view_model/ArticlesAddRemove/cubit/art_add_remove_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtAddRemoveCubit extends Cubit<ArtAddRemoveState> {
  final AddFavArtRepo _addFavRepo;
  final RemoveFavArtRepo _removeFavRepo;

  ArtAddRemoveCubit(this._addFavRepo, this._removeFavRepo)
      : super(const ArtAddRemoveState.initial());

  Future<void> addFav(String id) async {
    emit(const ArtAddRemoveState.loading());
    final result = await _addFavRepo.addArt(id);
    result.when(
      success: (artAddRemoveResponseModel) =>
          emit(ArtAddRemoveState.success(artAddRemoveResponseModel)),
      failure: (error) => emit(
          ArtAddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> removeFav(String id) async {
    emit(const ArtAddRemoveState.loading());
    final result = await _removeFavRepo.removeArt(id);
    result.when(
      success: (artAddRemoveResponseModel) =>
          emit(ArtAddRemoveState.success(artAddRemoveResponseModel)),
      failure: (error) => emit(
          ArtAddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }
}
