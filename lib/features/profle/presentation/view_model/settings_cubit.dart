import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/profle/data/models/saved_posts_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_routing.dart';
import '../../data/repo/settings_repository.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository repository;
  SettingsCubit({required this.repository}) : super(SettingsInitial());

    final forgetPasswordController = TextEditingController();
      final forgetPasswordFormKey = GlobalKey<FormState>();

 Future<void> forgetPassword(BuildContext context) async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      final response =
          await repository.forgetPassword(forgetPasswordController.text);
      response.fold((l) {
        l.message!.showToast();
        emit(ForgetPasswordErrorState());
      }, (r) {
        context.navigateTo(
          AppRoutes.verificationCodeScreen,
          arguments: {
            'email': r,
            'isResetPass': true,
          },
        );
        emit(ForgetPasswordSuccessState());
      });
    }
  }


  SavedPostsResponseModel? posts;
  List<SavedPost> savedPostsList = [];
  Future<void> getSavedPosts() async {

    emit(SavedPostsLoadingState());
    final response = await repository.getSavedPosts(
      SavedPostsRequestModel(cursor: posts?.nextCursor ?? 0),
    );
    response.fold((l) {
      emit(SavedPostsErrorState());
    }, (r) {
      posts = r;
      savedPostsList = r.posts ?? [];
      emit(SavedPostsSuccessState());
    });
  }

final ScrollController savedPostsScrollController = ScrollController();
  Future<void> loadMoreSavedPosts() async {
    if (posts == null || posts!.nextCursor == 0) return;

    emit(LoadMoreSavedPostsLoadingState());

    final response = await repository.getSavedPosts(
      SavedPostsRequestModel(cursor: posts!.nextCursor!),
    );

    response.fold((l) {
      emit(SavedPostsErrorState());
    }, (r) {
      posts = r;
      savedPostsList.addAll(r.posts ?? []);
      emit(SavedPostsSuccessState());
    });
  }
  String? profilePath;
  Future<void> uploadProfilePicture(File profilePicture, BuildContext context) async {
    emit(UploadProfilePictureLoadingState());

    final response = await repository.editProfilePicture(profilePicture);
    response.fold(
          (l) {
        l.message?.showToast();
        emit(UploadProfilePictureErrorState());
      },
          (r) {
            profilePath = r;
        emit(UploadProfilePictureSuccessState());
      },
    );
  }

}
