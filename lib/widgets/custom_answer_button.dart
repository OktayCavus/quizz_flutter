import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/widgets/custom_text.dart';

class CustomAnswerButton extends StatelessWidget {
  const CustomAnswerButton({
    super.key,
    required this.text,
    this.topLeft = 20,
    this.topRight = 20,
    this.bottomLeft = 20,
    this.bottomRight = 20,
    required this.onTap,
    required this.icon,
  });

  final String text;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.38,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft),
                  topRight: Radius.circular(topRight),
                  bottomLeft: Radius.circular(bottomLeft),
                  bottomRight: Radius.circular(bottomRight),
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Center(
                        child: Icon(
                      icon,
                      size: Get.width * .3,
                      color: Colors.blue,
                    )),
                    CustomText(
                      isHeadLine: true,
                      isQuestionHeadLine: true,
                      text: text,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
