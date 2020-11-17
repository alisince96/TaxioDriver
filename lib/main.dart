import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/LogInBloc/logInBloc.dart';
import 'package:taxio/MapListingBloc/ListingBloc.dart';
import 'package:taxio/Screens/EditAccountScreen.dart';
import 'package:taxio/Screens/EnterLocationScreen.dart';
import 'package:taxio/Screens/ForgotPasswordScreen.dart';
import 'package:taxio/Screens/HomeScreen.dart';
import 'package:taxio/Screens/PromotionScreen.dart';
import 'package:taxio/Screens/ReceiptScreen.dart';
import 'package:taxio/Screens/RegisterPhoneScreen.dart';
import 'package:taxio/Screens/SettingsScreen.dart';
import 'package:taxio/Screens/TaxioWalletScreen.dart';
import 'package:taxio/Screens/TripDetailsComplaintScreen.dart';
import 'package:taxio/Screens/TripDetailsScreen.dart';
import 'package:taxio/Screens/TripsScreen.dart';

import 'Screens/AuthScreen.dart';
import 'Screens/FareEstimateScreen.dart';
import 'Screens/RegisterNameEmailPW.dart';
import 'Screens/SignInScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegisterationBloc>(
              create: (BuildContext context) => RegisterationBloc()),
          BlocProvider<LogInBloc>(
              create: (BuildContext context) => LogInBloc()),
          BlocProvider<MapListingBloc>(
              create: (BuildContext context) => MapListingBloc()),
        ],
        child: MaterialApp(
          title: 'resisiter Demo',
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
            RegisterPhoneScreen.routeName: (ctx) => RegisterPhoneScreen(),
            RegisterNameEmailPW.routeName: (ctx) => RegisterNameEmailPW(),
            SignInScreen.routeName: (ctx) => SignInScreen(),
            ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          },
        ));
  }
}
