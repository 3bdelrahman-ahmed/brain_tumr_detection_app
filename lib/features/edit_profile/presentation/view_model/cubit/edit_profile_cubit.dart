import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:brain_tumr_detection_app/features/edit_profile/data/repo/edit_profile_repository.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepository repository;
  EditProfileCubit({required this.repository}) : super(EditProfileInitial());

  TextEditingController nameController = TextEditingController(
    text: AppConstants.user!.fullName,
  );
  TextEditingController emailController = TextEditingController(
    text: AppConstants.user!.email,
  );

  TextEditingController userNameController = TextEditingController(
    text: AppConstants.user!.userName,
  );

  

  File? profileImage;

  pickProfileImage() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (result != null) {
      profileImage = File(result.path);
      emit(EditProfileImagePicked(profileImage: profileImage));
    }
  }

  Future<void> updateProfile() async {
    emit(EditProfileLoading());
    final result = await repository.updateProfile(
      EditProfileRequestModel(
        name: nameController.text,
        email: emailController.text,
        userName: userNameController.text,
        profileImage: profileImage != null ? File(profileImage!.path) : null,
      ),
    );
    result.fold(
      (error) {
        emit(EditProfileError());
      },
      (response) {
        emit(EditProfileSuccess());
      },
    );
  }
}
