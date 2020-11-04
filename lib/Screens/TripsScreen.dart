import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxio/Screens/TripDetailsScreen.dart';

class TripsScreen extends StatelessWidget {
  static const routeName = '/TripsScreen';
  List<Trip> tripsData = [
    Trip(
      tripCount: 0,
      date: DateTime.now(),
      name: 'Ali',
      rating: 4,
    ),
    Trip(
      tripCount: 3,
      date: DateTime.now(),
      name: 'qwe',
      rating: 1,
    ),
    Trip(
      tripCount: 0,
      date: DateTime.now(),
      name: 'vfv',
      rating: 0,
    ),
    Trip(
      tripCount: 2,
      date: DateTime.now(),
      name: 'cdc',
      rating: 2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: constraints.maxHeight * 0.07,
                  child: Center(
                    child: Text(
                      'Your Past Trips',
                      style: TextStyle(fontSize: 23),
                    ),
                  )),
              Container(
                height: constraints.maxHeight * 0.93,
                child: ListView(
                  children: tripsData
                      .map((trip) => Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            height: 300,
                            child: GridTile(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    TripDetailsScreen.routeName,
                                    arguments: {
                                      'name': trip.name,
                                      'rating': trip.rating,
                                      'date': trip.date,
                                    },
                                  );
                                },
                                child: FadeInImage(
                                  placeholder:
                                      AssetImage('assets/images/map.jpg'),
                                  image: AssetImage('assets/images/map.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              footer: GridTileBar(
                                backgroundColor: Colors.grey[850],
                                leading: Icon(Icons.access_alarms),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${trip.date.toString().substring(0, 10)}   ${trip.date.toString().substring(12, 19)}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    trip.tripCount == 0
                                        ? Text(
                                            'cancelled',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        : Text('${trip.tripCount.toString()}',
                                            style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class Trip {
  final int tripCount;
  final DateTime date;
  String name;
  int rating;

  Trip(
      {@required this.tripCount,
      @required this.date,
      @required this.name,
      @required this.rating});
}
