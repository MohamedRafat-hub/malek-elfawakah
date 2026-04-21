
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(BuildContext context , {required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(
        child: Text(message , style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
          height: 1.60,
        ),),
      ), backgroundColor: Colors.green, duration: Duration(seconds: 1),)
  );
}
