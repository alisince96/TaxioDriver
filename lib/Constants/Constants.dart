import 'package:flutter/material.dart';

var deviceSize;
const colour = Color.fromRGBO(0, 200, 61, 1.0);

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth;

  const DotWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: 1.5,
          color: Colors.black,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String btnTxt;
  Function funk;
  ButtonWidget(this.funk, this.btnTxt);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.black,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: funk,
          minWidth: 350,
          height: 42.0,
          child: Text(
            btnTxt,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Function card = ([wid, colour]) {
  return Card(
      color: colour ?? Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: wid);
};

Function navFunction = (context, navPage) {
  Navigator.of(context).pushNamed(navPage);
};

Function background = ([wid]) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: ClipOval(
            child: Container(
              color: colour,
              width: double.infinity,
              height: deviceSize.height * 0.14,
            ),
          ),
        ),
      ),
      Container(
        height: deviceSize.height * 0.28,
        width: double.infinity,
        color: Color.fromRGBO(0, 200, 61, 1.0),
      ),
      wid ?? Text(''),
    ],
  );
};

class CircleBullet extends StatelessWidget {
  const CircleBullet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    );
  }
}

class PlacesItem extends StatelessWidget {
  String text;
  PlacesItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleBullet(),
        Text(
          '  $text',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class TextWidgetfont18 extends StatelessWidget {
  String text;
  TextWidgetfont18(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        '$text',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class TextWidgetfont25 extends StatelessWidget {
  String text;
  TextWidgetfont25(this.text);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        '$text',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
