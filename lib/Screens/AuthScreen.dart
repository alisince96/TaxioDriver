import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import '../Constants/Constants.dart';
import 'RegisterPhoneScreen.dart';
import 'SignInScreen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: deviceSize.height * 0.35,
              child: background(
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: deviceSize.width * 0.17,
                      child: Image.asset('assets/images/ic_logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: deviceSize.width * 0.7,
              child: Column(
                children: [
                  ButtonWidget(
                    () {
                      navFunction(context, SignInScreen.routeName);
                    },
                    'Sign In',
                  ),
                  ButtonWidget(
                    () {
                      navFunction(context, RegisterPhoneScreen.routeName);
                    },
                    'Register',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
