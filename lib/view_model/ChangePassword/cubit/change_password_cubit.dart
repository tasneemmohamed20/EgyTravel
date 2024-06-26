import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_request_body.dart';
import 'package:egy_travel/repositories/change_password_repo.dart';
import 'package:egy_travel/view_model/ChangePassword/cubit/change_password_state.dart';
import 'package:flutter/material.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangeRepo _changeRepo;
  ChangePasswordCubit(this._changeRepo)
      : super(const ChangePasswordState.initial());
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController currentpasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void emitChangeState(ChangeRequestBody changeRequestBody) async {
    emit(const ChangePasswordState.loading());
    final response = await _changeRepo.changePassword(changeRequestBody);
    response.when(success: (changeResponse) {
      emit(ChangePasswordState.success(changeResponse));
    }, failure: (error) {
      emit(ChangePasswordState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
