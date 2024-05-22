import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final bool isHeadLine;
  final bool? isQuestionHeadLine;
  final String text;
  const CustomText({
    super.key,
    required this.isHeadLine,
    this.isQuestionHeadLine,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final headline1 = Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
    final commentLine = Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
    final questionHeadline = Container(
      alignment: Alignment.bottomLeft,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (isHeadLine) {
      if (isQuestionHeadLine ?? false) {
        return questionHeadline;
      } else {
        return headline1;
      }
    } else {
      return commentLine;
    }
  }
}
