import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/change_email_code_model.dart';
import 'package:quizz_flutter/models/forget_password_model.dart';
import 'package:quizz_flutter/models/my_profile_model.dart';

class MyProfileController extends BaseController {
  Rx<MyProfileModel?>? responseValue = Rx<MyProfileModel?>(null);

  late TextEditingController userNameEC;
  late TextEditingController nameEC;
  late TextEditingController lastnameEC;
  late TextEditingController emailEC;
  late TextEditingController verifiedEC;
  late TextEditingController createdEC;
  late TextEditingController updatedEC;

  var changedFields = <String, dynamic>{}.obs;
  RxBool isAnythingChanged = false.obs;

  RxBool isChanged = false.obs;

  RxBool isRead = true.obs;
  RxBool isStabilRead = true.obs;
  RxBool isChangingEmail = false.obs;

  late FocusNode emailFocusNode;

  @override
  void onInit() async {
    userNameEC = TextEditingController();
    nameEC = TextEditingController();
    lastnameEC = TextEditingController();
    emailEC = TextEditingController();
    verifiedEC = TextEditingController();
    updatedEC = TextEditingController();
    createdEC = TextEditingController();
    await me();
    userNameEC.text = '${responseValue?.value?.data?.username}';
    nameEC.text = '${responseValue?.value?.data?.name}';
    lastnameEC.text = '${responseValue?.value?.data?.lastname}';
    emailEC.text = '${responseValue?.value?.data?.email}';
    verifiedEC.text = '${responseValue?.value?.data?.emailVerifiedAt}';
    updatedEC.text = '${responseValue?.value?.data?.updatedAt}';
    createdEC.text = '${responseValue?.value?.data?.createdAt}';
    emailFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    emailFocusNode.dispose();
    super.onClose();
  }

  void updateField(String field, String value) {
    changedFields[field] = value;
    isAnythingChanged.value = true;
  }

  me() async {
    isLoading.value = true;
    try {
      var request = await userService.currentUser();
      var response = myProfileModelFromJson(request);
      if (response.status == true) {
        responseValue?.value = response;
      } else {
        print('kullanıcı detayı getirme başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
      }
    } catch (e) {
      print('me $e');
    }
    isLoading.value = false;
  }

  Future<void> profileUpdateRequest() async {
    if (isAnythingChanged.value) {
      isLoading.value = true;
      try {
        var updatedFields = changedFields;
        var request = await userService.profileUpdate(updatedFields);
        var response = myProfileModelFromJson(request!);
        if (response.status == true) {
          await me();
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .17);
        } else {
          showCustomDialog('${response.message}',
              isHaveButton: false, height: Get.height * .17);
        }
      } catch (e) {
        print('profile request $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  forgetPassword() async {
    isLoading.value = true;
    try {
      var request = await userService
          .forgetPassword('${responseValue?.value?.data?.email}');
      var response = forgetPasswordModelFromJson(request);
      if (response.status == true) {
        showCustomDialog('Mailinizi kontrol ediniz',
            isHaveButton: false, height: Get.height * .2);
        Future.delayed(const Duration(milliseconds: 1700), () {
          Get.toNamed('/checkCode', parameters: {"isMyProfile": "true"});
        });
      } else {
        print('Sıfırlama başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
      }
    } catch (e) {
      print('forget password request $e');
    }
    isLoading.value = false;
  }

  Future<void> sendEmailChangeCodeRequest() async {
    isLoading.value = true;

    try {
      var request = await userService.sendEmailChangeCode(emailEC.text);
      storageBox.write('email', emailEC.text);
      var response = changeEmailCodeModelFromJson(request);
      if (response.status == true) {
        showCustomDialog('Mailinizi kontrol ediniz',
            isHaveButton: false, height: Get.height * .2);
        Future.delayed(const Duration(milliseconds: 1700), () {
          Get.toNamed('/checkCode', parameters: {"isMyProfile": "true"});
        });
      } else {
        print('Sıfırlama başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
      }
    } catch (e) {
      print('sendEmailChangeCodeRequest $e');
    }
    isLoading.value = false;
  }

  Future<void> changeEmail() async {
    isLoading.value = true;
    try {
      var request =
          await userService.changeEmail(storageBox.read('code'), emailEC.text);
      var response = forgetPasswordModelFromJson(request);
      if (response.status == true) {
        Get.offNamed('/myProfile');
        await me();
        showCustomDialog('Değiştirme işlemi başarılı',
            isHaveButton: false, height: Get.height * .2);
      } else {
        print('email değişme başarısız: ${response.message}');
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
      }
    } catch (e) {
      print('changeEmail $e');
    }
    isLoading.value = false;
  }
}
