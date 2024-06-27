import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Favorites/favorites_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavState with _$FavState {
  const factory FavState.initial() = _Initial;

  // Events
  const factory FavState.favloading() = Favloading;
  const factory FavState.favSuccess(
      FavResponseModel favResponseModel) = FavSuccess;
  const factory FavState.favError(ErrorHandler errorHandler) =
      FavError;
}
