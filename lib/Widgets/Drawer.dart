import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/Screens/EditAccountScreen.dart';
import 'package:taxio/Screens/PromotionScreen.dart';
import 'package:taxio/Screens/SettingsScreen.dart';
import 'package:taxio/Screens/TaxioWalletScreen.dart';
import 'package:taxio/Screens/TripsScreen.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width * 0.65,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: deviceSize.height * 0.3,
            width: double.infinity,
            child: FittedBox(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: deviceSize.width * 0.17,
                        ),
                        Positioned(
                          right: deviceSize.width * 0.02,
                          top: deviceSize.width * 0.04,
                          child: Container(
                            width: deviceSize.width * 0.095,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: IconButton(
                                icon: Icon(
                                  Icons.create,
                                  size: deviceSize.width * 0.050,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  navFunction(
                                      context, EditAccountScreen.routeName);

                                  // Navigator.pushNamed(
                                  //     context, EditAccountScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Raazia',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'raazia@gmai.com',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 17, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        navFunction(context, TripsScreen.routeName);

                        // Navigator.pushNamed(context, TripsScreen.routeName);
                      },
                      child: TxtWidget('Trips')),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        navFunction(context, PromotionScreen.routeName);
                        // Navigator.pushNamed(context, PromotionScreen.routeName);
                      },
                      child: TxtWidget('Promotion')),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        navFunction(context, SettingsScreen.routeName);

                        // Navigator.pushNamed(context, SettingsScreen.routeName);
                      },
                      child: TxtWidget('Settings')),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        navFunction(context, TaxioWalletScreen.routeName);

                        // Navigator.pushNamed(
                        //     context, TaxioWalletScreen.routeName);
                      },
                      child: TxtWidget('Taxio Wallet')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TxtWidget extends StatelessWidget {
  String txt;
  TxtWidget(this.txt);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontSize: 20),
    );
  }
}
