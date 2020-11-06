import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import 'package:taxio/Constants/Constants.dart';

class FareEstimateScreen extends StatelessWidget {
  static const routeName = '/FareEstimateScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: 270,
          height: 40,
          child: card(
              Padding(
                  padding: EdgeInsets.all(7),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        height: deviceSize.height * 0.35,
        child: background(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Add Home',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Add Work',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: DotWidget(
                    totalWidth: deviceSize.width * 0.90,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
