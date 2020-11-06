import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class ReceiptScreen extends StatelessWidget {
  static const routeName = '/ReceiptScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RowWidget('Base Fare', '1.00'),
              RowWidget('Distance Fare', '0.00'),
              RowWidget('Time Fare', '1.00'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: DotWidget(
                    totalWidth: deviceSize.width * 0.80,
                  ),
                ),
              ),
              RowWidget('Sub Total', '0.00'),
              RowWidget('Promotion', '0.00'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: DotWidget(
                    totalWidth: deviceSize.width * 0.80,
                  ),
                ),
              ),
              RowWidget('Cash', '1.00'),
            ],
          ),
        ));
  }
}

class RowWidget extends StatelessWidget {
  String txt;
  String value;
  RowWidget(this.txt, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWid('$txt'),
        TextWid('$value'),
      ],
    );
  }
}

class TextWid extends StatelessWidget {
  String txt;
  TextWid(this.txt);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$txt',
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
