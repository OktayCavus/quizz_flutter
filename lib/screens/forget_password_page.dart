import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/gap.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/forget_password_controller.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';
import 'package:quizz_flutter/widgets/custom_text_field.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  ForgetPasswordView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : Form(
                key: formKey,
                child: Padding(
                  padding: context.loginHorAndVerPad,
                  child: Column(
                    children: [
                      GapEnum.M.heightBox,
                      CustomFormBuilderTF(
                          isEmail: true,
                          labelText: 'Email',
                          controller: controller.forgetEC,
                          isRequired: true,
                          name: 'forget'),
                      GapEnum.M.heightBox,
                      CustomButton(
                          onTap: () async {
                            controller.forgetPassword();
                          },
                          buttonText: 'Şifre Sıfırla',
                          buttonColor: CustomColors.black,
                          textColor: CustomColors.white)
                    ],
                  ),
                )),
      ),
    );
  }
}
