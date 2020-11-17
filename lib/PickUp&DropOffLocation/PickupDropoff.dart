class PickUpLocation {
  String address = 'a';
  double latitude;
  double longitude;
  PickUpLocation({this.address, this.latitude, this.longitude});
}

class DropOffLocation {
  String address = 'a';
  double latitude;
  double longitude;
  DropOffLocation({this.address, this.latitude, this.longitude});
}

class DirectionDetails {
  String distanceText;
  String durationText;
  int distanceValue;
  int durationValue;
  String encodedPoints;
  DirectionDetails(
      {this.distanceText,
      this.distanceValue,
      this.durationText,
      this.durationValue,
      this.encodedPoints});
}
