import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      duration: Duration(seconds: 2),
    ),
  );
}
