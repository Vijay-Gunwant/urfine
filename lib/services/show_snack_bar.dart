import 'package:flutter/material.dart';

class ShowSnackBar{
  static void showSnackBar(BuildContext context,String message,{Color color = Colors.green}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
     final snackBar = SnackBar(
      content:  Text(message),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}