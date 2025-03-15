part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
@override
List<Object?> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}


final class LocationLoaded extends LocationState {
  final LatLng position;
  final CameraPosition cameraPosition;
  final Marker marker;

  LocationLoaded(this.position, this.cameraPosition, this.marker);
}

final class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}


