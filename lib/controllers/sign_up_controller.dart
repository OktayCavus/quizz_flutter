import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/register_model.dart';

class SignUpController extends BaseController {
  TextEditingController emailEC =
      TextEditingController(text: 'oktaycvs6161@gmail.com');
  TextEditingController passwordEC = TextEditingController(text: 'Test*123');
  TextEditingController usernameEC = TextEditingController(text: 'truxarr');
  TextEditingController nameEC = TextEditingController(text: 'oktay');
  TextEditingController lastnameEC = TextEditingController(text: 'cavus');

  Rx<RegisterModel?>? responseValue = Rx<RegisterModel?>(null);

  registerRequest() async {
    isLoading.value = true;
    try {
      var request = await userService.register(emailEC.text, usernameEC.text,
          nameEC.text, lastnameEC.text, passwordEC.text);

      var response = registerModelFromJson(request);

      if (response.status == true) {
        responseValue?.value = response;
        showCustomDialog('${responseValue?.value?.message}',
            isHaveButton: false, height: Get.height * .2);
        Future.delayed(const Duration(milliseconds: 1800), () {
          Get.offAllNamed('/login');
        });
      } else {
        print('Kayıt başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
      }
    } catch (e) {
      print('hata register request $e');
    }
    isLoading.value = false;
  }
}
