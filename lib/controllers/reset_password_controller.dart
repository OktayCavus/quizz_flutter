import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/reset_password_model.dart';

class ResetPasswordController extends BaseController {
  TextEditingController resetPasswordEC = TextEditingController();

  resetPassword() async {
    String isMyProfile = Get.parameters['isMyProfile'].toString();
    String isForget = Get.parameters['isForget'].toString();
    isLoading.value = true;
    try {
      var request = await userService.resetPassword(
          storageBox.read('code'), resetPasswordEC.text);
      var response = resetPasswordModelFromJson(request);

      if (response.status == true) {
        showCustomDialog('Sıfırlama başarılı',
            isHaveButton: false, height: Get.height * 0.15);
        Future.delayed(const Duration(milliseconds: 1800), () {
          // ! burda uygulama içinden mi ana ekrandan mı kontrol yap
          if (isMyProfile == 'true') {
            Get.offAllNamed('/myProfile');
          } else if (isForget == 'true') {
            Get.offNamed('/login');
          }
        });
      } else {
        print('Sıfırlama başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .15);
      }
    } catch (e) {
      print('hataa reset password $e');
    }

    isLoading.value = false;
  }
}
