import 'package:easy_localization/easy_localization.dart';

import 'state.dart';
import 'package:bloc/bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  bool validatePassword(String value) {
    if (value.length < 8) return false;
    bool hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
    return hasLetter;
  }

  void signUp(String email, String password, String name, String address) {
    emit(SignUpLoading());
    if (name.isEmpty) {
      emit(SignUpFailed("ValidName".tr()));
      return;
    }
    if (email.isEmpty || !email.contains('@')) {
      emit(SignUpFailed("ValidEmail".tr()));
      return;
    }
    if (address.isEmpty) {
      emit(SignUpFailed("ValidAddress".tr()));
      return;
    }
    if (!validatePassword(password)) {
      emit(SignUpFailed("ValidPassword".tr()));
      return;
    }
    emit(SignUpSuccess());
  }
}
