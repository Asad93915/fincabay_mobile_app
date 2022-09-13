import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationServices {
  static void goNextAndKeepHistory(
      {required BuildContext context, required Widget widget}) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return widget;
    }));
  }

  static void goNextAndDoNotKeepHistory(
      {required BuildContext context, required Widget widget}) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static void goNextAndReplaceHistory(
      {required BuildContext context, required Widget widget}) {


    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
      return widget;
    }));



  }
}
