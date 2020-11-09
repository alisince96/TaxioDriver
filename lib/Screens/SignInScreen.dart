import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/Screens/HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _validate = false;

  String emailHint = 'Email Address';
  String passwordHint = 'Password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceSize.height * 0.35,
              child: background(),
            ),
            SizedBox(
              height: deviceSize.height * 0.18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: emailHint,
                      hintStyle: TextStyle(
                          color:
                              _validate ? Colors.redAccent : Colors.grey[600]),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: passwordHint,
                      hintStyle: TextStyle(
                          color:
                              _validate ? Colors.redAccent : Colors.grey[600]),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            ButtonWidget(HomeScreen.routeName, 'Register'),
          ],
        ),
      ),
    );
  }
}
