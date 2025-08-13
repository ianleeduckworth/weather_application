import 'package:geolocator/geolocator.dart';

///Gets the user's current position. If permission is not given then this method will throw an error
Future<Position> getCurrentPosition() async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission was denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission is permanently denied');
  }

  return await Geolocator.getCurrentPosition();
}
