import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/list_category_model.dart';
import 'package:quizz_flutter/models/user_tests_model.dart';

class ListTestController extends BaseController {
  RxInt selectedCategoryId = 0.obs;
  Rxn<ListTest> testList = Rxn<ListTest>();
  @override
  void onInit() async {
    super.onInit();
    selectedCategoryId.value = storageBox.read('selectedCategoryId');
    await listTestRequest();
  }

  listTestRequest() async {
    try {
      isLoading.value = true;
      var request = await userService.getCategoryTest(selectedCategoryId.value);
      if (request != null) {
        var response = listTestModelFromJson(request);
        if (response.status == true) {
          testList.value = response.data;
        } else {
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .2);
          testList.value = null;
        }
      } else {
        showCustomDialog('Failed to load data',
            isHaveButton: false, height: Get.height * .2);
        testList.value = null;
      }
    } catch (e) {
      print('listTestRequest $e');
      testList.value = null;
    }
    isLoading.value = false;
  }
}
