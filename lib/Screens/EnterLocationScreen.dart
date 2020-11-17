import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:taxio/PickUp&DropOffLocation/PickupDropoff.dart';
import 'package:taxio/Widgets/Drawer.dart';
import '../Constants/Constants.dart';
import 'FareEstimateScreen.dart';

PickUpLocation pickUpLocation;
DropOffLocation dropOffLocation;

class EnterLocationScreen extends StatefulWidget {
  static const routeName = '/EnterLocationScreen';

  @override
  _EnterLocationScreenState createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  PickResult pickUp;
  PickResult dropOff;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: SafeArea(
        child: Draw(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey:
                                  'AIzaSyDF2jk_6QlbwWBhsKMjrj2D0lmArQHIrk0', // Put YOUR OWN KEY here.
                              onPlacePicked: (result) {
                                pickUpLocation = PickUpLocation(
                                    address: result.formattedAddress,
                                    latitude: result.geometry.location.lat,
                                    longitude: result.geometry.location.lng);
                                print(pickUpLocation.address);
                                print(pickUpLocation.latitude);
                                print(pickUpLocation.longitude);
                                setState(() {
                                  pickUp = result;
                                });
                                Navigator.of(context).pop();
                              },
                              useCurrentLocation: true,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          (pickUp == null)
                              ? Text(
                                  ' Source',
                                  style: TextStyle(fontSize: 17),
                                )
                              : Container(
                                  width: deviceSize.width * 0.75,
                                  child: Text('\$${pickUpLocation.address}'),
                                ),
                        ],
                      ),
                    ),
                    Container(
                        height: 80,
                        child: VerticalDivider(
                          thickness: 3,
                          color: Colors.green,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey:
                                  'AIzaSyDF2jk_6QlbwWBhsKMjrj2D0lmArQHIrk0', // Put YOUR OWN KEY here.
                              onPlacePicked: (result) {
                                dropOffLocation = DropOffLocation(
                                    address: result.formattedAddress,
                                    latitude: result.geometry.location.lat,
                                    longitude: result.geometry.location.lng);
                                print(dropOffLocation.address);
                                print(dropOffLocation.latitude);
                                print(dropOffLocation.longitude);
                                setState(() {
                                  dropOff = result;
                                });
                                Navigator.of(context).pop();
                              },
                              useCurrentLocation: true,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                          ),
                          (dropOff == null)
                              ? Text(
                                  ' Destination Required',
                                  style: TextStyle(fontSize: 17),
                                )
                              : Container(
                                  width: deviceSize.width * 0.75,
                                  child: Text('\$${dropOffLocation.address}'),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            color: Colors.grey[850],
            child: Center(
              child: SizedBox(
                width: 250,
                height: 40,
                child: card(
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'getDirection');
                    },
                    child: Center(
                      child: Text(
                        'Request Cheapest',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
