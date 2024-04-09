import 'package:flutter/material.dart';
import 'package:ur_fine/utils/dimesions.dart';

class DisplayText extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onPress;
  const DisplayText({Key? key, required this.text1, required this.text2, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
            text1,
        ),
        TextButton(
            onPressed: onPress,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            child: Text(
                text2,
                style:  TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w900,
                  fontSize: Dimensions.font15
              ),
            ),
          ),
      ],
    );
  }
}
