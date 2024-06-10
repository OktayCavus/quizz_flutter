import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/login_model.dart';

class LoginController extends BaseController {
  RxBool obsecureText = true.obs;
  Rx<LoginModel?>? responseValue = Rx<LoginModel?>(null);

  RxBool isChecked = false.obs;

  TextEditingController eMailEC =
      TextEditingController(text: 'oktaycvs6161@gmail.com');
  TextEditingController passwordEC = TextEditingController(text: 'Test*123!!');

  @override
  void onInit() {
    if (isCheckedFunction()) {
      eMailEC.text = storageBox.read('email') ?? "";
      passwordEC.text = storageBox.read('password') ?? "";
    }

    super.onInit();
  }

  bool isCheckedFunction() {
    if (storageBox.read('isChecked') == true) {
      isChecked.value = true;
      return true;
    } else {
      isChecked.value = false;
      return false;
    }
  }

  Future<void> loginRequest() async {
    isLoading.value = true;
    try {
      if (eMailEC.text.isNotEmpty && passwordEC.text.isNotEmpty) {
        var request = await userService.login(
          eMailEC.text.trim(),
          passwordEC.text.trim(),
        );

        var response = loginModelFromJson(request);

        if (response.status == true) {
          if (isChecked.value) {
            storageBox.write('email', eMailEC.text);
            storageBox.write('password', passwordEC.text);
          } else {
            storageBox.remove('email');
            storageBox.remove('password');
          }

          storageBox.write('isChecked', isChecked.value);
          storageBox.write('accessToken', response.data?.token);
          storageBox.write('name', response.data?.user?.name);

          responseValue?.value = response;
          Get.offAllNamed('/selectQuiz');
        } else {
          print('Giriş başarısız: ${response.message}');
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .2);
        }
      }
    } catch (e) {
      print('login request hata: $e');
    }
    isLoading.value = false;
  }
}
