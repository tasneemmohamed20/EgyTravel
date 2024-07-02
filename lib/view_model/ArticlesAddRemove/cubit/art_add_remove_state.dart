import 'package:egy_travel/model/Favorites/articles/art_add_remove_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'art_add_remove_state.freezed.dart';

@freezed
class ArtAddRemoveState with _$ArtAddRemoveState {
  const factory ArtAddRemoveState.initial() = _Initial;
  const factory ArtAddRemoveState.loading() = Loading;
  const factory ArtAddRemoveState.success(ArtAddRemoveResponseModel data) = Success;
  const factory ArtAddRemoveState.error({required String message}) = Error;
}
