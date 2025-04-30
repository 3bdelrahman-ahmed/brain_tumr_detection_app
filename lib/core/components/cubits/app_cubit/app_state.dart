part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class GetDoctorsClinicsLoading extends AppState {
  final bool isPaging;
  GetDoctorsClinicsLoading({this.isPaging = false});
}

class GetDoctorsClinicsSuccess extends AppState {}

class GetDoctorsClinicsError extends AppState {
  final String message;
  GetDoctorsClinicsError(this.message);
}

final class ChangeLanguage extends AppState {
  final bool Language;

  ChangeLanguage(this.Language);
}