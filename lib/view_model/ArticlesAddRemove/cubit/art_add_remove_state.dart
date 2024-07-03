import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/Profile/get_profile_response.dart';
part 'art_add_remove_state.freezed.dart';

@freezed
class ArtAddRemoveState with _$ArtAddRemoveState {
  const factory ArtAddRemoveState.initial() = _Initial;
  const factory ArtAddRemoveState.loading() = Loading;
  const factory ArtAddRemoveState.success(GetProfileResponseModel data) = Success;
  const factory ArtAddRemoveState.error({required String message}) = Error;
}
