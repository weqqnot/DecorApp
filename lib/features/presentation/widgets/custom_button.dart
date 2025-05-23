import 'package:decor_home_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.width,
      this.height,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 207,
        height: height ?? 45,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorsApp.salmon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(text, style: textStyle),
        ));
  }
}
