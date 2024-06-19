import 'package:egy_travel/model/SignUp/signup_request_body.dart';
import 'package:egy_travel/repositories/signup_repo.dart';
import 'package:flutter/material.dart';

import 'sign_up_state.dart';
import 'package:bloc/bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signUpRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmationController.text,
        address: addressController.text,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignUpState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
