import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../services/location_service.dart';

part '../../../../core/components/cubits/location_cubit/location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService;

  LocationCubit(this._locationService) : super(LocationInitial()) {
    fetchLocation();
  }

  // Fetch initial location
  Future<void> fetchLocation() async {
    emit(LocationLoading());
    try {
      final position = await _locationService.getCurrentLocation();
      LatLng latLng = LatLng(position.latitude, position.longitude);
      CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 15);
      Marker marker = Marker(
        markerId: MarkerId("current_location"),
        position: latLng,
      );
      emit(LocationLoaded(latLng, cameraPosition, marker));
    } catch (e) {
      emit(LocationError("Error fetching location: $e"));
    }
  }

  // Update marker position when user moves the map
  void updateLocation(LatLng newPosition) {
    Marker newMarker = Marker(
      markerId: MarkerId("current_location"),
      position: newPosition,
    );
    emit(LocationLoaded(newPosition, CameraPosition(target: newPosition, zoom: 15), newMarker));
  }
}
