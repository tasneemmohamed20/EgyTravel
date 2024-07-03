import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/Profile/get_profile_response.dart';
part 'add_remove_state.freezed.dart';

@freezed
class AddRemoveState with _$AddRemoveState {
  const factory AddRemoveState.initial() = _Initial;
  const factory AddRemoveState.addFavLoading() = AddFavLoading;
  const factory AddRemoveState.addFavSuccess(GetProfileResponseModel data) =
      AddFavSuccess;
  const factory AddRemoveState.addFavError({required String message}) =
      AddFavError;

  const factory AddRemoveState.addTripLoading() = AddTripLoading;
  const factory AddRemoveState.addTripSuccess(GetProfileResponseModel data) =
      AddTripSuccess;
  const factory AddRemoveState.addTripError({required String message}) =
      AddTripError;
}
