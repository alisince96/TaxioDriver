import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import 'EditAccountScreen.dart';

enum popUpVal {
  Edit,
  LogOut,
}

class SettingsScreen extends StatelessWidget {
  static const routeName = '/SettingsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
        actions: <Widget>[
          PopUpMenu(),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: deviceSize.height * 0.35,
            child: background(
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: deviceSize.width * 0.2,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: deviceSize.height * 0.50,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextWidgetfont25('Profile'),
                SizedBox(
                  height: 20,
                ),
                TextWidgetfont18('Name \nRazia'),
                SizedBox(
                  height: 20,
                ),
                TextWidgetfont18('Taxio Balance \n0'),
                SizedBox(
                  height: 20,
                ),
                TextWidgetfont18('Email \nraazia@gmail.com'),
                SizedBox(
                  height: 20,
                ),
                TextWidgetfont18('Mobile \n039999999999'),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: DotWidget(
                      totalWidth: deviceSize.width * 0.90,
                    ),
                  ),
                ),
                TextWidgetfont25('Places'),
                SizedBox(
                  height: 20,
                ),
                PlacesItem('Add Home'),
                PlacesItem('Add Work'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (popUpVal selectedValue) {
        if (selectedValue == popUpVal.Edit) {
          Navigator.pushNamed(context, EditAccountScreen.routeName);
        } else {}
      },
      color: Colors.grey[850],
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EditAccountScreen.routeName);
            },
            child: Text(
              'Edit Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: popUpVal.Edit,
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: null,
            child: Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: popUpVal.LogOut,
        ),
      ],
    );
  }
}
