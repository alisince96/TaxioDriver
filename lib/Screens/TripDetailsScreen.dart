import 'package:flutter/material.dart';
import 'package:taxio/Screens/TripDetailsComplaintScreen.dart';
import 'package:taxio/Constants/Constants.dart';

class TripDetailsScreen extends StatelessWidget {
  static const routeName = '/TripDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final trip =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RichText(
          text: TextSpan(
              text: '${trip['date'].toString().substring(0, 10)} ',
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '          ${trip['date'].toString().substring(12, 19)}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ]),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TripDetailsComplaintScreen.routeName,
                    arguments: {
                      'name': trip['name'],
                      'rating': trip['rating'],
                      'date': trip['date'],
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: deviceSize.width * 0.05,
                  child: Text(
                    '?',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              height: 170,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 90,
                      color: Colors.grey[850],
                      child: Row(
                        children: [
                          Container(
                            width: deviceSize.width * 0.27,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${trip['name']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Testing Driver Update',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  'you rated',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${trip['rating'].toString()}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: colour,
                        radius: deviceSize.width * 0.1,
                        child: Icon(
                          Icons.people,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
