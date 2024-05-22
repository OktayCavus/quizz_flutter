import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/forget_password_model.dart';

class ForgetPasswordController extends BaseController {
  TextEditingController forgetEC =
      TextEditingController(text: "oktaycvs6161@gmail.com");

  RxBool res = false.obs;

  void forgetPassword() async {
    isLoading.value = true;
    try {
      var request = await userService.forgetPassword(forgetEC.text.trim());
      var response = forgetPasswordModelFromJson(request);
      if (response.status == true) {
        showCustomDialog('Mailinizi kontrol ediniz',
            isHaveButton: false, height: Get.height * .15);
        Future.delayed(const Duration(milliseconds: 1700), () {
          Get.toNamed('/checkCode', parameters: {"isForget": "true"});
        });
      } else {
        print('Sıfırlama başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .15);
      }
    } catch (e) {
      print('forget password request $e');
    }
    isLoading.value = false;
  }
}
