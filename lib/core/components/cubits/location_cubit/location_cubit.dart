import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<Position> fetchLocationService() async{
    return await _locationService.getCurrentLocation();
  }

  Future<void> fetchLocation() async {
    emit(LocationLoading());
    try {
      final Position fetchedPosition = await fetchLocationService();
      LatLng latLng =
          LatLng(fetchedPosition.latitude, fetchedPosition.longitude);
      String streetName = await fetchAddress(latLng);

      CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 18);
      emit(LocationLoaded(latLng, cameraPosition, streetName));
    } catch (e) {
      emit(LocationError("Error fetching location: $e"));
    }
  }

  Future<String> fetchAddress(LatLng position)async{
    try {
      final placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      return placeMarks.isNotEmpty
          ? "${placeMarks.first.street}, ${placeMarks.first.administrativeArea}, ${placeMarks.first.country}"
          : "Unknown Road";
    } catch (e) {
      return "Unknown Road";
    }
  }
  void updateLocation(LatLng newPosition) async{
    String streetName = await fetchAddress(newPosition);
    CameraPosition newCameraPosition =
        CameraPosition(target: newPosition, zoom: 15);
    print("Long : ${newPosition.longitude} + Street : ${streetName}");
    emit(LocationLoaded(newPosition, newCameraPosition, streetName));
  }
}
