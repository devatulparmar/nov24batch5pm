import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class MySnackBar {
  static showMySnackBar(
      {
    required String content,
    void Function()? function,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor:backgroundColor ?? Colors.black,
        padding: const EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        duration: const Duration(seconds: 15),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          onPressed: function ?? (){},
          label: "Close",
          textColor: Colors.white,
        ),
      ),
    );
  }
}
