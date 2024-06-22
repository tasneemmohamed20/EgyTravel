import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/ResetPassword/reset_request_body.dart';
import 'package:egy_travel/repositories/reset_repo.dart';
import 'package:egy_travel/view_model/ResetCubit/cubit/reset_password_state.dart';
import 'package:flutter/material.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetRepo _resetRepo;
  ResetPasswordCubit(this._resetRepo) : super(const ResetPasswordState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void emitResetState(ResetRequestBody resetRequestBody) async {
    emit(const ResetPasswordState.loading());
    final response = await _resetRepo.resetPassword(resetRequestBody);
    response.when(success: (resetResponse) {
      emit(ResetPasswordState.success(resetResponse));
    }, failure: (error) {
      emit(ResetPasswordState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
