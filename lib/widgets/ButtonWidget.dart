import 'package:flutter/material.dart';
import 'package:ur_fine/utils/dimesions.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double size;
 final VoidCallback onPress;
  const ButtonWidget({Key? key, required this.text,  this.size = 0, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width250,
      height: Dimensions.height50,
      child: ElevatedButton(
    onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(87, 93, 251, 1),
          // padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
      ),
      ),
        child: Text(
          text,
          textAlign:TextAlign.center,
          style:  TextStyle(
            color: Colors.white,

            fontFamily: "Inter",
            fontWeight: FontWeight.w900,
            fontSize: size==0?Dimensions.font18:size
          ),
      )
      ),
    );
  }
}
