import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/Screens/SignInScreen.dart';

class RegisterNameEmailPW extends StatefulWidget {
  static const routeName = '/RegisterNameEmailPW';

  @override
  _RegisterNameEmailPWState createState() => _RegisterNameEmailPWState();
}

class _RegisterNameEmailPWState extends State<RegisterNameEmailPW> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showLoader = false;

  RegisterationBloc _registerationBloc;
  initState() {
    super.initState();
    _registerationBloc = BlocProvider.of<RegisterationBloc>(context);
  }

  TextEditingController textController = TextEditingController();
  bool _validate = false;
  int index = 0;
  String txt = "What's your name?";
  String hint = 'Enter your Name';
  IconData icon = Icons.account_circle;
  String name;
  String email;
  String password;
  var route = RegisterNameEmailPW.routeName;

  void changeContent() {
    if (index == 0) {
      setState(() {
        txt = "What's your Name?";
        hint = 'Enter your Name';
        icon = Icons.account_circle;
      });
    } else if (index == 1) {
      setState(() {
        txt = "What's your email?";
        hint = 'Enter your Email';
        icon = Icons.alternate_email_rounded;
      });
    } else if (index == 2) {
      setState(() {
        txt = "Enter your Password?";
        hint = 'Enter your Password';
        icon = Icons.lock;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = ModalRoute.of(context).settings.arguments;
    return BlocConsumer<RegisterationBloc, RegisterationState>(
      cubit: _registerationBloc,
      listener: (context, state) {
        if (state is LoadingState) {
          showLoader = true;
        } else if (state is ErrorState) {
          setState(() {
            showLoader = false;
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text(state.error)));
          });
        } else if (state is RegisterSuccess) {
          showLoader = false;
          Navigator.pushReplacementNamed(
            context,
            SignInScreen.routeName,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: deviceSize.height * 0.35,
                    child: background(),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: colour,
                              child: Icon(
                                icon,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$txt",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(color: colour)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: TextField(
                                controller: textController,
                                keyboardType: (index == 1)
                                    ? TextInputType.emailAddress
                                    : TextInputType.name,
                                onChanged: (value) {
                                  if (index == 0) {
                                    name = value;
                                  } else if (index == 1) {
                                    email = value;
                                  } else if (index == 2) {
                                    password = value;
                                  }
                                },
                                obscureText: (index == 2) ? true : false,
                                decoration: InputDecoration(
                                  hintText: hint,
                                  hintStyle: TextStyle(
                                      color: _validate
                                          ? Colors.redAccent
                                          : Colors.grey),
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
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (index == 2) {
                                      email = null;
                                      password = null;
                                    } else if (index == 1) {
                                      name = null;
                                      email = null;
                                      password = null;
                                    }
                                    setState(() {
                                      if (index != 0) {
                                        index--;
                                        changeContent();
                                      }
                                      if (index == 0) {
                                        return;
                                      } else {
                                        _validate = false;
                                        textController.text = '';
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: deviceSize.width * .06,
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (index == 1 &&
                                        (textController.text.isEmpty ||
                                            !textController.text
                                                .contains('@'))) {
                                      setState(() {
                                        textController.text = '';
                                        hint = 'Invalid email!';
                                        _validate = true;
                                      });
                                      return;
                                    } else if (textController.text.isEmpty) {
                                      setState(() {
                                        hint = "This Field can't be empty";
                                        _validate = true;
                                      });
                                      return;
                                    } else if (index == 3) {
                                      return;
                                    } else {
                                      _validate = false;
                                      textController.text = '';
                                      if (index < 2) {
                                        setState(() {
                                          index++;
                                        });
                                      }
                                      changeContent();
                                    }
                                    if (name != null &&
                                        email != null &&
                                        phoneNumber != null &&
                                        password != null) {
                                      _registerationBloc.add(RegisterTrigger(
                                          name: name,
                                          email: email,
                                          password: password,
                                          phone: phoneNumber));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: deviceSize.width * .06,
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
