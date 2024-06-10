import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/services/user_service.dart';
import 'package:quizz_flutter/widgets/custom_dialog.dart';

class BaseController extends GetxController {
  final UserService userService = UserService();

  final GetStorage storageBox = GetStorage();

  RxBool isLoading = false.obs;

  void showCustomDialog(
    String title, {
    String? description,
    bool? isHaveButton,
    Function? onTap1,
    Function? onTap2,
    IconData? iconData,
    double? height,
    String? confirmButtonText,
  }) {
    CustomDialogBox customDialog = CustomDialogBox(
      title: title,
      descriptions: description ?? '',
      isHaveButton: isHaveButton ?? true,
      onTap1: onTap1,
      onTap2: onTap2,
      iconData: iconData,
      confirmButtonText: confirmButtonText ?? 'logout',
      height: height,
    );
    bool haveButton = isHaveButton ?? true;

    Get.dialog(
      customDialog,
    );

    if (haveButton == false) {
      Future.delayed(const Duration(milliseconds: 1400), () {
        Get.back();
      });
    }
  }

  loading({required BuildContext context}) {
    return AlertDialog(
      elevation: 0,
      shadowColor: CustomColors.transparent,
      backgroundColor: CustomColors.transparent,
      content: SizedBox(
        height: Get.height * 0.2,
        width: Get.width * 0.2,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: CustomColors.transparent,
          ),
        ),
      ),
    );
  }
}
