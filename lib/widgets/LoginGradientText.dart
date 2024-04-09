import 'package:flutter/material.dart';

class LinearGradientText extends StatelessWidget {
  const LinearGradientText({Key? key, required this.text, required this.fontSize, required this.gradient,  this.tx = TextAlign.center}) : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign tx;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white, // This color won't matter, it will be overridden by the shader
        ),
        textAlign: tx,
      ),
    );
  }
}
