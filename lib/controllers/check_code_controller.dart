import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/controllers/my_profile_controller.dart';
import 'package:quizz_flutter/models/check_code_model.dart';

class CheckCodeController extends BaseController {
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController(text: ""));

  final _myProfileController = Get.find<MyProfileController>();

  RxString code = "".obs;

  checkCodeRequest() async {
    String isMyProfile = Get.parameters['isMyProfile'].toString();
    String isForget = Get.parameters['isForget'].toString();
    isLoading.value = true;
    CheckCodeModel response;
    try {
      if (_myProfileController.isChangingEmail.value) {
        var request = await userService.checkEmailCode(handleSubmit());
        response = checkCodeModelFromJson(request);
        if (response.status == true) {
          storageBox.write('code', '${response.data?.code}');
          await _myProfileController.changeEmail();
        } else {
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .15);
        }
      } else {
        var request = await userService.checkCode(handleSubmit());
        response = checkCodeModelFromJson(request);
        if (response.status == true) {
          storageBox.write('code', '${response.data?.code}');

          Get.offNamed("/resetPassword",
              parameters: {"isForget": isForget, "isMyProfile": isMyProfile});
        } else {
          print('Code check başarısız: ${response.message}');
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .15);
        }
      }
    } catch (e) {
      print('hata check code req $e');
    }
    isLoading.value = false;
  }

  void handleTextChange(BuildContext context, int index, String value) {
    if (value.isNotEmpty) {
      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }

  String handleSubmit() {
    code.value = controllers.fold("", (previousValue, controller) {
      return previousValue + controller.text;
    });
    return code.value;
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
