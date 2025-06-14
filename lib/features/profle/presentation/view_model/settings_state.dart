part of 'settings_cubit.dart';

sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsTap extends SettingsState {}


final class ForgetPasswordLoadingState extends SettingsState {}
final class ForgetPasswordSuccessState extends SettingsState {}
final class ForgetPasswordErrorState extends SettingsState {

}


final class SavedPostsLoadingState extends SettingsState {}
final class SavedPostsSuccessState extends SettingsState {
}
final class SavedPostsErrorState extends SettingsState {

}


class UploadProfilePictureLoadingState extends SettingsState {}
class UploadProfilePictureSuccessState extends SettingsState {}
class UploadProfilePictureErrorState extends SettingsState {}


final class LoadMoreSavedPostsLoadingState extends SettingsState {}

