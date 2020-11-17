import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxio/PickUp&DropOffLocation/PickupDropoff.dart';
import 'package:taxio/Web_services/GetDataFromHttp.dart';

class MapPolyLinesProvider {
  static Future<DirectionDetails> getDirectionDetails(
      LatLng startPosition, LatLng endPosition) async {
    // String placeAddress = '';
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult != ConnectivityResult.mobile &&
    //     connectivityResult != ConnectivityResult.wifi) {}

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition.latitude},${startPosition.longitude}&destination=${endPosition.latitude},${endPosition.longitude}&mode=driving&key=AIzaSyDF2jk_6QlbwWBhsKMjrj2D0lmArQHIrk0';

    var response = await GetDataFromHttp.apiPostWithoutParam(url);

    if (response == 'failed') {
      return null;
    }
    DirectionDetails directionDetails = DirectionDetails();

    directionDetails.durationText =
        response['routes'][0]['legs'][0]['steps'][0]['distance']['text'];
    directionDetails.durationValue =
        response['routes'][0]['legs'][0]['steps'][0]['distance']['value'];

    directionDetails.distanceText =
        response['routes'][0]['legs'][0]['steps'][0]['distance']['text'];
    directionDetails.distanceValue =
        response['routes'][0]['legs'][0]['steps'][0]['distance']['value'];

    directionDetails.encodedPoints =
        response['routes'][0]['overview_polyline']['points'];
    return directionDetails;
  }
}
