import 'package:flutter/material.dart';
import '../Constants.dart';
import 'HomeScreen.dart';
import 'RegisterScreen.dart';

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
                  ButtonWidget(HomeScreen.routeName, 'Sign In'),
                  ButtonWidget(RegisterScreen.routeName, 'Register'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
