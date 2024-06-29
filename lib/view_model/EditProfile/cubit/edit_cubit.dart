import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:egy_travel/repositories/edit_repo.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditCubit extends Cubit<EditState> {
  final EditRepo _editRepo;
  EditCubit(this._editRepo) : super(const EditState.initial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  File? avatarFile;

  Future<void> updateProfile(String? spareAvatar) async {
    emit(const EditState.editLoading());
     MultipartFile? avatarMultipartFile;
    if (avatarFile != null) {
      avatarMultipartFile = await MultipartFile.fromFile(avatarFile!.path);
    }
    final response = await _editRepo.editProfile(
      name: nameController.text ,
      email: emailController.text,
      phone: phoneController.text,
      avatar: avatarMultipartFile,
      spareAvatar: spareAvatar
    );
    response.when(success: (editResponse) {
      emit(EditState.editSuccess(editResponse));
    }, failure: (error) {
      emit(EditState.editError(error: error.apiErrorModel.message ?? 'An error occurred'));
    });
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      avatarFile = File(image.path);
      log('avatar: ${avatarFile!.path}');
    }
  }
}