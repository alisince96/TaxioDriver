import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/PickUp&DropOffLocation/PickupDropoff.dart';
import 'package:taxio/Providers/MapCoordinateProvider.dart';
import 'package:taxio/Screens/EnterLocationScreen.dart';
import 'package:taxio/Screens/FareEstimateScreen.dart';
import 'package:taxio/Widgets/Drawer.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

enum SelectedCar {
  cheapest,
  test,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var geoLocator = Geolocator();
  double mapBottomPadding = 50;

  Position currentPosition;
  void setupPositionLocator() async {
    Position position = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = {};
  Set<Marker> _Markers = {};
  Set<Circle> _Circles = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  SelectedCar car;
  bool isExpanded = false;
  var isDragDown;
  bool showLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Draw(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showLoader,
        child: Stack(
          children: [
            GoogleMap(
              // padding: EdgeInsets.only(bottom: mapBottomPadding),
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              polylines: _polylines,
              markers: _Markers,
              circles: _Circles,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;
                setupPositionLocator();
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/whatsapp.png'),
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.grey[850],
                        size: 50,
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          var response = await showDialog(
                              context: context, child: EnterLocationScreen());
                          if (response == 'getDirection') {
                            await getDirection();
                          }
                          //navFunction(context, EnterLocationScreen.routeName);
                        },
                        child: card(
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 30, right: 30),
                            child: Text(
                              'Set Pick Up Location',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setupPositionLocator();
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: colour,
                          child: Icon(
                            Icons.my_location,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      color: Colors.black.withOpacity(0.7),
                      duration: Duration(milliseconds: 300),
                      height: isExpanded ? 200 : 100,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onVerticalDragStart: (value) {
                                    isDragDown = value;

                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      isExpanded = true;
                                      car = SelectedCar.cheapest;
                                    });
                                  },
                                  child: Button(
                                    car == SelectedCar.cheapest
                                        ? colour
                                        : Color(0x00000000),
                                    'Cheapest',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onVerticalDragStart: (value) {
                                    isDragDown = value;
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      isExpanded = true;

                                      car = SelectedCar.test;
                                    });
                                  },
                                  child: Button(
                                    car == SelectedCar.test
                                        ? colour
                                        : Color(0x00000000),
                                    'Test',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: isExpanded ? 100 : 0,
                              color: Colors.grey[900],
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'ETA',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '0 min',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            child: VerticalDivider(
                                                color: Colors.white)),
                                        Expanded(
                                          child: FittedBox(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Max Size',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '3',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            child: VerticalDivider(
                                                color: Colors.white)),
                                        Expanded(
                                          child: FittedBox(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Min Fare',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '0',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            FareEstimateScreen.routeName);
                                      },
                                      child: card(
                                        Text(
                                          '   Get Fare Estimate   ',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getDirection() async {
    var pickLatLng = LatLng(pickUpLocation.latitude, pickUpLocation.longitude);
    var destinationLatLng =
        LatLng(dropOffLocation.latitude, dropOffLocation.longitude);

    setState(() {
      showLoader = true;
    });

    var thisDetails = await MapPolyLinesProvider.getDirectionDetails(
        pickLatLng, destinationLatLng);
    setState(() {
      showLoader = false;
    });
    print(thisDetails.encodedPoints);
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> results =
        polylinePoints.decodePolyline(thisDetails.encodedPoints);
    polylineCoordinates.clear();
    if (results.isNotEmpty) {
      results.forEach((PointLatLng points) {
        polylineCoordinates.add(LatLng(points.latitude, points.longitude));
      });
    }
    _polylines.clear();
    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId('polyid'),
          color: Colors.indigoAccent,
          points: polylineCoordinates,
          jointType: JointType.round,
          width: 4,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true);
      _polylines.add(polyline);
    });
    LatLngBounds bounds;
    if (pickLatLng.latitude > destinationLatLng.latitude &&
        pickLatLng.longitude > destinationLatLng.longitude) {
      bounds =
          LatLngBounds(southwest: destinationLatLng, northeast: pickLatLng);
    } else if (pickLatLng.longitude > destinationLatLng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(pickLatLng.latitude, destinationLatLng.longitude),
          northeast: LatLng(destinationLatLng.latitude, pickLatLng.longitude));
    } else if (pickLatLng.latitude > destinationLatLng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destinationLatLng.latitude, pickLatLng.longitude),
          northeast: LatLng(pickLatLng.latitude, destinationLatLng.longitude));
    } else {
      bounds =
          LatLngBounds(southwest: pickLatLng, northeast: destinationLatLng);
    }
    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 70));

    Marker pickupMarker = Marker(
      markerId: MarkerId('PickUpLocation'),
      position: pickLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(snippet: 'My Location'),
    );

    Marker destinationMarker = Marker(
      markerId: MarkerId('destination'),
      position: destinationLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(snippet: 'Destination'),
    );
    setState(() {
      _Markers.add(pickupMarker);
      _Markers.add(destinationMarker);
    });
    Circle pickupCircle = Circle(
        circleId: CircleId('pickup'),
        strokeColor: Colors.amber,
        strokeWidth: 3,
        radius: 12,
        center: pickLatLng,
        fillColor: Colors.transparent);

    Circle destinationCircle = Circle(
        circleId: CircleId('destination'),
        strokeColor: Colors.indigoAccent,
        strokeWidth: 3,
        radius: 12,
        center: destinationLatLng,
        fillColor: Colors.transparent);

    setState(() {
      _Circles.add(pickupCircle);
      _Circles.add(destinationCircle);
    });
  }
}

class Button extends StatelessWidget {
  Color colour;
  String btnTxt;

  Button(
    this.colour,
    this.btnTxt,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: colour, width: 3),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Icon(
              Icons.directions_car,
              size: 35,
            ),
          ),
          FittedBox(
            child: Text(
              btnTxt,
              style: TextStyle(
                  fontSize: 15,
                  color: colour == Color(0x00000000) ? Colors.white : colour),
            ),
          ),
        ],
      ),
    );
  }
}
