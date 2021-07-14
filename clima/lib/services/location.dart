import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
// Get location At initState
////In the below function GetLocation:
  /// you can use only async : to run the process in the background, but in this
  /// case, the return Type will be of type Future<Position>
  /// but if you added the keyword await, the compiler will not go forward till
  /// the task is totally complete. The return type in this case is Postition.
  Future getCurrentLocation() async {
    // await can be used only with async
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // When using await, funciton should return an object of type Future
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }
}
