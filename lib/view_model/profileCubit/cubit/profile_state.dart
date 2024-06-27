import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  // Events
  const factory ProfileState.profileloading() = Profileloading;
  const factory ProfileState.profileSuccess(
      GetProfileResponseModel getProfileResponseModel) = ProfileSuccess;
  const factory ProfileState.profileError(ErrorHandler errorHandler) =
      ProfileError;
}
