import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_state.freezed.dart';

@freezed
class EditState<T> with _$EditState<T> {
  const factory EditState.initial() = _Initial;
  const factory EditState.editLoading() = EditLoading;
  const factory EditState.editSuccess(T data) = EditSuccess<T>;
  const factory EditState.editError({required String error}) = EditError;
}
