import 'package:egy_travel/model/Search/search_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.success(SearchResponseModel data) = Success;
  const factory SearchState.error({required String message}) = Error;
}
