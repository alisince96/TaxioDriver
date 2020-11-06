import 'package:flutter/material.dart';
import 'package:taxio/Constants/Constants.dart';
import 'package:taxio/Screens/ReceiptScreen.dart';

class TripDetailsComplaintScreen extends StatefulWidget {
  static const routeName = '/TripDetailsComplaintScreen';

  @override
  _TripDetailsComplaintScreenState createState() =>
      _TripDetailsComplaintScreenState();
}

class _TripDetailsComplaintScreenState
    extends State<TripDetailsComplaintScreen> {
  List items = [
    {'text': 'I was Incorrectly charge cancellation fee', 'isCheck': false},
    {'text': 'I would like a refund', 'isCheck': false},
    {'text': 'My driver was unprofessional', 'isCheck': false},
    {'text': 'My vehicle wasnt what i expected', 'isCheck': false},
    {'text': 'I Lost an Item', 'isCheck': false},
    {'text': 'I had an Issue with receipt or Payment', 'isCheck': false},
  ];

  @override
  Widget build(BuildContext context) {
    final trip =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RichText(
          text: TextSpan(
              text: '${trip['date'].toString().substring(0, 10)} ',
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '          ${trip['date'].toString().substring(12, 19)}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ]),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          height: deviceSize.height * 0.9,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: deviceSize.height * 0.4,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: deviceSize.height * 0.065,
                        ),
                        Container(
                          height: deviceSize.height * 0.1,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: deviceSize.width * 0.27,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${trip['name']}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Testing Driver',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        'you rated',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${trip['rating'].toString()}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: deviceSize.height * 0.18,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: DotWidget(
                                    totalWidth: deviceSize.width * 0.90,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cash 1.00',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    card(
                                      GestureDetector(
                                        onTap: () {
                                          navFunction(
                                              context, ReceiptScreen.routeName);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.all(7),
                                            child: Text(
                                              'Receipt',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(0, 200, 61, 1.0)),
                                    ),
                                    Text(
                                      ' Canal View',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(0, 200, 61, 1.0)),
                                    ),
                                    txtWid('Johar Town', deviceSize),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: DotWidget(
                                    totalWidth: deviceSize.width * 0.90,
                                  ),
                                ),
                                ...items
                                    .map(
                                      (item) => ListTileWid(
                                        item['isCheck'],
                                        () {
                                          for (var singleItem in items) {
                                            singleItem['isCheck'] = false;
                                          }

                                          setState(() {
                                            item['isCheck'] = !item['isCheck'];
                                          });
                                        },
                                        txtWid('${item['text']}', deviceSize),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: deviceSize.height * .055,
                          width: double.infinity,
                          color: Colors.white,
                          child: Center(
                            child: card(Padding(
                                padding: EdgeInsets.all(2),
                                child: FittedBox(
                                  child: Text(
                                    '         Submit         ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ))),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 200, 61, 1.0),
                        radius: deviceSize.width * 0.1,
                        child: Icon(
                          Icons.people,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class ListTileWid extends StatelessWidget {
  bool isCheck;
  Function tap;
  Widget wid;
  ListTileWid(this.isCheck, this.tap, this.wid);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isCheck ? Colors.grey[300] : Colors.transparent,
      child: ListTile(
        dense: true,
        onTap: tap,
        leading: wid,
        trailing: isCheck
            ? Icon(
                Icons.check,
                color: Color.fromRGBO(0, 200, 61, 1.0),
              )
            : null,
      ),
    );
  }
}

class txtWid extends StatelessWidget {
  String txt;
  Size size;
  txtWid(this.txt, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      child: Text(
        ' $txt',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
