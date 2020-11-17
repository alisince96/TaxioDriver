import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/LogInBloc/logInBloc.dart';
import 'package:taxio/LogInBloc/logInEvent.dart';
import 'package:taxio/LogInBloc/logInstate.dart';
import 'package:taxio/Screens/HomeScreen.dart';

import 'ForgotPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showLoader = false;
  String email;
  String password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  String emailHint = 'Email Address';
  String passwordHint = 'Password';

  LogInBloc _logInBloc;
  @override
  void initState() {
    super.initState();
    _logInBloc = BlocProvider.of<LogInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: _logInBloc,
      listener: (BuildContext context, state) {
        if (state is SignInLoadingState) {
          setState(() {
            showLoader = true;
          });
        } else if (state is SignInErrorState) {
          setState(() {
            showLoader = false;
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text(state.error)));
          });
        } else if (state is SignInSuccess) {
          showLoader = false;
          Navigator.pushReplacementNamed(
            context,
            HomeScreen.routeName,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: showLoader,
          child: Scaffold(
            key: _scaffoldKey,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: colour)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: emailHint,
                            hintStyle: TextStyle(
                                color: _validate
                                    ? Colors.redAccent
                                    : Colors.grey[600]),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: colour)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: passwordHint,
                            hintStyle: TextStyle(
                                color: _validate
                                    ? Colors.redAccent
                                    : Colors.grey[600]),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Container(
                    width: deviceSize.width * 0.6,
                    child: ButtonWidget(
                      () {
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                        // _logInBloc.add(SignInEvent(email, password));
                      },
                      'Log In',
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        navFunction(context, ForgotPasswordScreen.routeName);
                      },
                      child: Text('Forgot Password'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
