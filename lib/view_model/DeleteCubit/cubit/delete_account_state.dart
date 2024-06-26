import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState<T> with _$DeleteAccountState<T> {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = Loading;
  const factory DeleteAccountState.success(T data) = Success<T>;
  const factory DeleteAccountState.error({required String error}) = Error;
}
