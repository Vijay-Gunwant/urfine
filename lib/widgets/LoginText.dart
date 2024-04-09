import 'package:flutter/material.dart';
import 'package:ur_fine/utils/dimesions.dart';

// ignore: must_be_immutable
class LoginBigText extends StatelessWidget {
  final String text;
  double size;
  Color color;
   TextAlign align;
  LoginBigText({Key? key, required this.text,  this.size=0,this.color=const Color.fromRGBO(87, 93, 251, 1),  this.align = TextAlign.center,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,

        style:  TextStyle(
        fontFamily: "Inter",
        color: color,
        fontWeight: FontWeight.w900,
        fontSize: size==0?Dimensions.font24:size,
      ),
      textAlign: align,
    );
  }
}
