part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class ChangeLanguage extends AppState {
  final bool Language;

  ChangeLanguage(this.Language);
}
final class GetDoctorsClinicsLoading extends AppState {}
final class GetDoctorsClinicsSuccess extends AppState {}
class GetDoctorsClinicsError extends AppState {
  final String message;

  GetDoctorsClinicsError(this.message);
}
