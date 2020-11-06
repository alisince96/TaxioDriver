import 'package:flutter/material.dart';
import '../Constants/Constants.dart';

class EditAccountScreen extends StatelessWidget {
  static const routeName = '/EditAccountScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Edit Account'),
      ),
      body: ListView(
        children: [
          Container(
            height: deviceSize.height * 0.35,
            child: background(
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: deviceSize.width * 0.17,
                      ),
                      Positioned(
                        right: deviceSize.width * 0.06,
                        top: deviceSize.width * 0.06,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.create,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: deviceSize.height * 0.51,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Mobile ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.edit),
                        hintText: 'Enter Mobile Number',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: deviceSize.width * .07,
                        backgroundColor: colour,
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
