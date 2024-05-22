import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/check_code_model.dart';

class SelectQuizController extends BaseController {
  logoutRequest() async {
    isLoading.value = true;
    var request = await userService.logout();
    var response = checkCodeModelFromJson(request);
    if (response.status == true) {
      storageBox.erase();
      showCustomDialog('Çıkış başarılı',
          isHaveButton: false, height: Get.height * .2);
      Future.delayed(const Duration(milliseconds: 1800), () {
        Get.offAllNamed('/login');
      });
    } else {
      print('hata logout request ${response.message}');
      showCustomDialog('${response.message}',
          isHaveButton: false, height: Get.height * .15);
    }
    isLoading.value = false;
  }
}
