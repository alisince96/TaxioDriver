import 'package:flutter/material.dart';
import 'package:taxio/Constants.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  _onCountryChange(CountryCode countryCode) {
    return countryCode.toString();
  }

  String code;

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
              height: deviceSize.height * 0.04,
            ),
            Container(
              height: 50,
              width: deviceSize.width * 0.7,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(color: Colors.black)),
                child: Center(
                  child: CountryCodePicker(
                    onChanged: (e) => {
                      setState(() {
                        code = _onCountryChange(e);
                      })
                    },
                    initialSelection: 'Pakistan',
                    favorite: ['+39', 'Pakistan'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.04,
            ),
            Container(
              height: 50,
              width: deviceSize.width * 0.7,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(color: Colors.black)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: 100,
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: code == null
                              ? Text(
                                  '+ 92',
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  '$code',
                                  style: TextStyle(fontSize: 15),
                                ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Number',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: deviceSize.height * 0.3,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
