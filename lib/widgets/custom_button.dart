import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final String? imageName;
  final Color buttonColor;
  final Color textColor;
  final Function()? onTap;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool? visible;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      this.imageName,
      required this.textColor,
      this.onTap,
      this.icon,
      this.textStyle,
      this.width,
      this.height,
      this.visible});

  @override
  Widget build(BuildContext context) {
    final bool isHaveIcon = icon != null ? true : false;
    final bool isVisible = visible != null ? true : false;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height ?? Get.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
            child: Row(
          children: [
            isHaveIcon
                ? Expanded(
                    flex: 3,
                    child: Icon(
                      icon,
                      color: CustomColors.white,
                    ))
                : const SizedBox.shrink(),
            if (imageName != null)
              (Image.asset(
                imageName ?? "",
                width: Get.width * 0.1,
              )),
            !isVisible
                ? Expanded(
                    flex: 10,
                    child: isHaveIcon
                        ? Text(
                            buttonText,
                            style: textStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: textColor),
                          )
                        : Center(
                            child: Text(
                              buttonText,
                              style: textStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: textColor),
                            ),
                          ),
                  )
                : const SizedBox(),
          ],
        )),
      ),
    );
  }
}
