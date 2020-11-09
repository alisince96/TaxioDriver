import 'package:flutter/material.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/Screens/RegisterNameEmailPW.dart';

class OPTscreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  _OPTscreenState createState() => _OPTscreenState();
}

class _OPTscreenState extends State<OPTscreen> {
  TextEditingController textController = TextEditingController();
  bool _validate = false;
  String hint = 'Enter the code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: deviceSize.height * 0.35,
              child: background(),
            ),
            Container(
                height: deviceSize.height * 0.15,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Enter The Verification Code",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
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
            Container(
              height: deviceSize.height * 0.196,
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  if (textController.text.isEmpty) {
                    setState(() {
                      hint = "This Field can't be empty";
                      _validate = true;
                    });
                  } else {
                    navFunction(context, RegisterNameEmailPW.routeName);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: deviceSize.width * .07,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
