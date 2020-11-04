import 'package:flutter/material.dart';
import 'package:taxio/Screens/EditAccountScreen.dart';
import 'package:taxio/Screens/EnterLocationScreen.dart';
import 'package:taxio/Screens/HomeScreen.dart';
import 'package:taxio/Screens/PromotionScreen.dart';
import 'package:taxio/Screens/ReceiptScreen.dart';
import 'package:taxio/Screens/RegisterScreen.dart';
import 'package:taxio/Screens/SettingsScreen.dart';
import 'package:taxio/Screens/TaxioWalletScreen.dart';
import 'package:taxio/Screens/TripDetailsComplaintScreen.dart';
import 'package:taxio/Screens/TripDetailsScreen.dart';
import 'package:taxio/Screens/TripsScreen.dart';

import 'Screens/AuthScreen.dart';
import 'Screens/FareEstimateScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AuthScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        TripsScreen.routeName: (ctx) => TripsScreen(),
        PromotionScreen.routeName: (ctx) => PromotionScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        EditAccountScreen.routeName: (ctx) => EditAccountScreen(),
        TaxioWalletScreen.routeName: (ctx) => TaxioWalletScreen(),
        TripDetailsScreen.routeName: (ctx) => TripDetailsScreen(),
        TripDetailsComplaintScreen.routeName: (ctx) =>
            TripDetailsComplaintScreen(),
        ReceiptScreen.routeName: (ctx) => ReceiptScreen(),
        FareEstimateScreen.routeName: (ctx) => FareEstimateScreen(),
        EnterLocationScreen.routeName: (ctx) => EnterLocationScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
      },
    );
  }
}