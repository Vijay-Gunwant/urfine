import 'package:flutter/material.dart';
import 'package:ur_fine/utils/dimesions.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  double size;
   InputWidget({Key? key, required this.label,this.size=0, required this.hint, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style:  TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: size==0?Dimensions.font15:size,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Customize border radius as desired
            border: Border.all(
              color: const Color.fromRGBO(87, 93, 251, 1),
            ),
          ),
          child:   TextField(
            style: const TextStyle(
                fontFamily: 'Inter',
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(200, 200, 200, 1),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(200, 200, 200, 1)
              ),
              prefixIcon: Icon(
                  icon ,
                  color: const Color.fromRGBO(87, 93, 251, 1)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
