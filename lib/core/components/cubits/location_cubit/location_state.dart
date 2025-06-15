part of '../../../../core/components/cubits/location_cubit/location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final LatLng position;
  final CameraPosition cameraPosition;
  final String streetName;
  LocationLoaded(this.position, this.cameraPosition, this.streetName);
}

final class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
