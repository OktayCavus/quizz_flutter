import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/all_category_model.dart';
import 'package:quizz_flutter/models/check_code_model.dart';

class SelectQuizController extends BaseController {
  RxString name = "".obs;
  RxList<AllCategory> allCategory = <AllCategory>[].obs;

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
          isHaveButton: false, height: Get.height * .2);
    }
    isLoading.value = false;
  }

  getAllCategory() async {
    isLoading.value = true;
    try {
      var request = await userService.allCategory();
      var response = allCategoryModelFromJson(request);
      if (response.status == true) {
        allCategory.value = response.data ?? [];
      } else {
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
        allCategory.value = [];
      }
    } catch (e) {
      print('getAllCategory hata $e');
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    name.value = storageBox.read('name');
  }
}
