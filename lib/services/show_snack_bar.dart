import 'package:flutter/material.dart';

class ShowSnackBar{
  static void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    const snackBar = SnackBar(
      content: Text('Working on It'),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}