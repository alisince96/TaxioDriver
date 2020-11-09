import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:taxio/Widgets/Drawer.dart';
import '../Constants/Constants.dart';
import 'FareEstimateScreen.dart';

class EnterLocationScreen extends StatelessWidget {
  PickResult selectedPlace;

  static const routeName = '/EnterLocationScreen';
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
          selectedPlace == null
              ? Container()
              : Text(selectedPlace.formattedAddress ?? ""),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                                print(result.geometry.location.lat);
                                print(result.geometry.location.lng);
                                selectedPlace = result;
                                Navigator.of(context).pop();
                              },
                              useCurrentLocation: true,
                            ),
                          ),
                        );
                        // Navigator.pushNamed(
                        //     context, FareEstimateScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          ),
                          Text(
                            ' Source',
                            style: TextStyle(fontSize: 17),
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
                        Navigator.pushNamed(
                            context, FareEstimateScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                          ),
                          Text(
                            ' Destination Required',
                            style: TextStyle(fontSize: 17),
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
                  Center(
                    child: Text(
                      'Request Cheapest',
                      style: TextStyle(color: Colors.white),
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
