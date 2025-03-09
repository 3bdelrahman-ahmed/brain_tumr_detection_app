import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
@injectable
class LocationService {
  /// Checks if location services are enabled and requests permissions.
  Future<bool> _checkPermissions() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (!serviceEnabled){
      if (permission == LocationPermission.denied) {
        if (permission == LocationPermission.denied) {
          throw Exception("Location permission denied.");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            "Location permission permanently denied. Enable it in settings.");
      }
    }
    return true;
  }
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  /// Fetches the user's current location with high accuracy.
  Future<Position> getCurrentLocation() async {
    try {
      await _checkPermissions();
      return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings
      );
    } catch (e) {
      throw Exception("Failed to get location: $e");
    }
  }

  /// Listens for real-time location updates.
  // Stream<Position> getLocationStream() {
  //   return Geolocator.getPositionStream(
  //     locationSettings: const LocationSettings(
  //       accuracy: LocationAccuracy.best,
  //       distanceFilter: 10, // Update when user moves 10 meters
  //     ),
  //   );
  // }
}
