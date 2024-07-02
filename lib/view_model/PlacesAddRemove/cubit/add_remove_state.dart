import 'package:egy_travel/model/Favorites/places/add_remove_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_remove_state.freezed.dart';

@freezed
class AddRemoveState with _$AddRemoveState {
  const factory AddRemoveState.initial() = _Initial;
  const factory AddRemoveState.loading() = Loading;
  const factory AddRemoveState.success(AddRemoveResponseModel data) = Success;
  const factory AddRemoveState.error({required String message}) = Error;
}
