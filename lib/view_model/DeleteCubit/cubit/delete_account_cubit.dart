import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_request_body.dart';
import 'package:egy_travel/repositories/delete_repo.dart';
import 'package:egy_travel/view_model/DeleteCubit/cubit/delete_account_state.dart';
import 'package:flutter/material.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteRepo _deleteRepo;
  DeleteAccountCubit(this._deleteRepo)
      : super(const DeleteAccountState.initial());
  final TextEditingController passwordController = TextEditingController();
  
  void emitDeleteState(DeleteRequestBody deleteRequestBody) async {
    emit(const DeleteAccountState.loading());
    final response = await _deleteRepo.deleteAccount(deleteRequestBody);
    response.when(success: (deleteResponse) {
      emit(DeleteAccountState.success(deleteResponse));
    }, failure: (error) {
      emit(DeleteAccountState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
