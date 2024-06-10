import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/gap.dart';
import 'package:quizz_flutter/controllers/login_controller.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';
import 'package:quizz_flutter/widgets/custom_text_button.dart';
import 'package:quizz_flutter/widgets/custom_text_field.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * .04,
                            vertical: context.height * .1),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: Get.height * .2,
                                  child: Center(
                                      child: Image.asset(imagePath('quizz')))),
                              GapEnum.S.heightBox,
                              customSizedBox(),
                              emailTextField(),
                              customSizedBox(),
                              passwordTextField(),
                              customSizedBox(),
                              loginButton(context),
                              customSizedBox(),
                              // ! beni hatırla butonu gelecek
                              SizedBox(
                                height: Get.height * 0.04,
                                width: Get.width * 0.4,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: CustomColors.black,
                                        value: controller.isChecked.value,
                                        onChanged: (newValue) {
                                          controller.isChecked.value =
                                              newValue!;
                                        }),
                                    const Text('Beni Hatırla')
                                  ],
                                ),
                              ),
                              customSizedBox(),
                              registerAndForgetButton(context),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget emailTextField() {
    return CustomFormBuilderTF(
      controller: controller.eMailEC,
      name: 'email',
      isRequired: true,
      isEmail: true,
      labelText: "Email",
    );
  }

  Widget passwordTextField() {
    return Obx(
      () => CustomFormBuilderTF(
        controller: controller.passwordEC,
        name: 'Password',
        isRequired: true,
        hintStyle: const TextStyle(fontWeight: FontWeight.w200),
        isPassword: true,
        labelText: "Password",
        isObsecureText: controller.obsecureText.value,
      ),
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );

  Row registerAndForgetButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextButton(
          onPressed: () {
            Get.toNamed('/forgetPassword');
          },
          buttonText: 'Şifremi unuttum',
        ),
        CustomTextButton(
          onPressed: () => Get.toNamed('/signUp'),
          buttonText: 'Hesap Olustur',
        ),
      ],
    );
  }

  Center loginButton(context) {
    return Center(
        child: CustomButton(
      buttonColor: CustomColors.buttonColor,
      textColor: CustomColors.buttonTextColor,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          await controller.loginRequest();
        }
      },
      buttonText: 'Giris Yap',
    ));
  }
}
