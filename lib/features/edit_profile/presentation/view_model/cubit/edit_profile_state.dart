part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}
final class EditProfileSuccess extends EditProfileState {

}
final class EditProfileError extends EditProfileState {

}

  final class EditProfileImagePicked extends EditProfileState {
      final File? profileImage;
        const EditProfileImagePicked({this.profileImage});
          @override
          List<Object> get props => [profileImage ?? ''];
  }
