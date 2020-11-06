import 'package:flutter/material.dart';

class AppGlobal {
  static final RegExp _emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool isValidEmail(String email) {
    if (email != null && email.isNotEmpty && _emailRegExp.hasMatch(email))
      return true;
    else
      return false;
  }

  static bool isValidPassword(String password) {
    if (password.length > 6)
      return true;
    else
      return false;
  }

  static bool isValidString(String text) {
    if (text != null && text.isNotEmpty)
      return true;
    else
      return false;
  }

  static SnackBar showMessageInSnackBar(String message) {
    return SnackBar(
      content: Text(message),
    );
  }
}
