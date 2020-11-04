import 'package:flutter/material.dart';

class TaxioWalletScreen extends StatelessWidget {
  static const routeName = '/TaxioWalletScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              'Taxio Balance',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
          ],
        ));
  }
}
