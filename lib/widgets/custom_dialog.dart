import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/constants/text_styles.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';

class CustomDialogBox extends StatelessWidget {
  final String title, descriptions;
  final String? buttonText1, buttonText2;
  final bool? isHaveButton;
  final Function? onTap1, onTap2;
  final IconData? iconData;
  final String confirmButtonText;
  final double? height;
  const CustomDialogBox({
    super.key,
    required this.title,
    required this.descriptions,
    this.isHaveButton,
    this.buttonText1,
    this.buttonText2,
    this.onTap1,
    this.onTap2,
    this.iconData,
    this.height,
    required this.confirmButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final haveButton = isHaveButton ?? true;
    final heightt = height ?? 0.23;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      child: Container(
        height: haveButton ? Get.height * .26 : heightt,
        width: Get.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment:
              !haveButton ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            context.heightBox(.022),
            Text(
              title,
              style: CustomTextStyle.dialogMainText(),
            ),
            context.heightBox(.024),
            // iconData != null
            // ? Lottie.asset(checkLottie, height: 70, width: 70)
            // :
            Text(
              descriptions,
              style: CustomTextStyle.dialogDescText(color: Colors.grey[800]),
              textAlign: TextAlign.center,
            ),
            context.heightBox(.055),
            haveButton
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: CustomButton(
                            onTap: () {
                              if (onTap2 != null) onTap2!();
                            },
                            buttonText: buttonText2 ?? 'İptal',
                            buttonColor: CustomColors.buttonColor,
                            textColor: CustomColors.buttonTextColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, left: 4),
                          child: CustomButton(
                            onTap: () {
                              if (onTap1 != null) onTap1!();
                            },
                            buttonText: buttonText1 ?? confirmButtonText,
                            buttonColor: CustomColors.buttonColor,
                            textColor: CustomColors.buttonTextColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
