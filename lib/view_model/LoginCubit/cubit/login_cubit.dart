import 'package:bloc/bloc.dart';
import 'package:egy_travel/Data/Networking/dio_factory.dart';
import 'package:egy_travel/core/helpers/constants.dart';
import 'package:egy_travel/core/helpers/shared_pref_helper.dart';
import 'package:egy_travel/model/Login/login_request_body.dart';
import 'package:egy_travel/repositories/login_repo.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse) async {
      await saveUSerToken(loginResponse.token ?? "");
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveUSerToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
