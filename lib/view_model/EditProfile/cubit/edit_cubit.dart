import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/Profile/EditProfile/edit_request_body.dart';
import 'package:egy_travel/repositories/edit_repo.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_state.dart';
import 'package:flutter/material.dart';

class EditCubit extends Cubit<EditState> {
  final EditRepo _editRepo;
  EditCubit(this._editRepo) : super(const EditState.initial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();

  void emitEditState(EditRequestBody editRequestBody) async {
    emit(const EditState.editLoading());
    final response = await _editRepo.editProfile(editRequestBody);
    response.when(success: (editResponse) {
      emit(EditState.editSuccess(editResponse));
    }, failure: (error) {
      emit(EditState.editError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
