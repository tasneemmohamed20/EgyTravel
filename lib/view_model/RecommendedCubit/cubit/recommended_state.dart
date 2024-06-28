import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Recommended/recommended_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended_state.freezed.dart';

@freezed
class RecommendedState with _$RecommendedState {
  const factory RecommendedState.initial() = _Initial;
  const factory RecommendedState.getRecommendedloading() =
      GetRecommendedloading;
  const factory RecommendedState.getRecommendedSuccess(
    RecommendationResponseModel recommendationResponseModel,
  ) = GetRecommendedSuccess;
  const factory RecommendedState.getRecommendedError(
      ErrorHandler errorHandler) = GetRecommendedError;
}
