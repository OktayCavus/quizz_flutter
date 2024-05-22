import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/my_profile_controller.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';
import 'package:quizz_flutter/widgets/profile_info_widget.dart';

class MyProfilePage extends GetView<MyProfileController> {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/selectQuiz');
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        actions: [
          Obx(
            () => CustomButton(
              buttonText: 'Güncelle',
              buttonColor: CustomColors.black,
              textColor: CustomColors.white,
              width: Get.width * 0.13,
              icon: controller.isRead.value ? Icons.edit : Icons.save,
              visible: true,
              onTap: () async {
                if (controller.isRead.value) {
                  controller.isRead.value = false;
                } else {
                  if (controller.isChangingEmail.value) {
                    await controller.sendEmailChangeCodeRequest();
                  } else {
                    await controller.profileUpdateRequest();
                  }

                  controller.isRead.value = true;
                }
              },
            ),
          ),
          context.widthBox(0.02),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : SingleChildScrollView(
                child: Padding(
                  padding: context.filterPad,
                  child: Column(
                    children: [
                      ProfileInfoWidget(
                          userData: controller.responseValue?.value),
                      context.heightBox(.05),
                      CustomButton(
                        buttonText: 'Şifre Sıfırla',
                        buttonColor: CustomColors.black,
                        textColor: CustomColors.white,
                        width: Get.width * 0.5,
                        height: Get.height * 0.06,
                        onTap: () async {
                          controller.forgetPassword();
                        },
                      ),
                      context.heightBox(.03),
                      CustomButton(
                        buttonText: 'Mail Değiştür',
                        buttonColor: CustomColors.black,
                        textColor: CustomColors.white,
                        width: Get.width * 0.5,
                        height: Get.height * 0.06,
                        onTap: () {
                          controller.isChangingEmail.value =
                              !controller.isChangingEmail.value;
                          controller.isRead.value = false;
                          controller.emailFocusNode.requestFocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
