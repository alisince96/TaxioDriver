import 'package:flutter/material.dart';
import 'package:taxio/Constants.dart';

class PromotionScreen extends StatelessWidget {
  static const routeName = '/PromotionScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            height: deviceSize.height * 0.35,
            child: background(),
          ),
          Container(
            height: deviceSize.height * 0.50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'With You When You Want To Keep \n Moving Forward',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 14,
                    width: 90,
                    child: Card(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: deviceSize.width * 0.5,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Promo Code',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    child: Material(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 300,
                        height: 42.0,
                        child: Text(
                          'ADD CODE',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
