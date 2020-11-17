import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxio/Constants/Constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController textController = TextEditingController();

  bool _validate = false;

  String hint = 'Enter Your Email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: deviceSize.height * 0.35,
              child: background(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: deviceSize.height * 0.15,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            hintText: hint,
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
                ),
                SizedBox(
                  height: deviceSize.height * 0.09,
                ),
                Container(
                  width: deviceSize.width * 0.6,
                  child: ButtonWidget(
                    () {
                      if (textController.text.isEmpty ||
                          !textController.text.contains('@')) {
                        setState(() {
                          textController.text = '';
                          hint = "Invalid Email";
                          _validate = true;
                        });
                      } else {
                        // navFunction(context, RegisterNameEmailPW.routeName);
                      }
                    },
                    'SUBMIT',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
