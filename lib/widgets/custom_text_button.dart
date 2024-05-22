import 'package:flutter/material.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.textColor = CustomColors.black});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
