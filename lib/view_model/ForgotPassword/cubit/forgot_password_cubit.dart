import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_request_body.dart';
import 'package:egy_travel/repositories/forgot_repo.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:flutter/material.dart';

class ForgotCubit extends Cubit<ForgotState> {
  final ForgotRepo _forgotRepo;
  ForgotCubit(this._forgotRepo) : super(const ForgotState.initial());
  final TextEditingController emailController = TextEditingController();
  void emitForgotState(ForgotRequestBody forgotRequestBody) async {
    emit(const ForgotState.loading());
    final response = await _forgotRepo.forgot(forgotRequestBody);
    response.when(success: (forgotResponse) {
      emit(ForgotState.success(forgotResponse));
    }, failure: (error) {
      emit(ForgotState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
