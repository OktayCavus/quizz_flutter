import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/sign_up_controller.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';
import 'package:quizz_flutter/widgets/custom_text_field.dart';

class SignUp extends GetView<SignUpController> {
  SignUp({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            key: formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customSizedBox(context),
                                  emailTextField(),
                                  customSizedBox(context),
                                  nameTF(),
                                  customSizedBox(context),
                                  lastnameTF(),
                                  customSizedBox(context),
                                  userNameTF(),
                                  customSizedBox(context),
                                  passwordTextField(),
                                  customSizedBox(context),
                                  customSizedBox(context),
                                  signUpButton(),
                                ]),
                          ))
                    ],
                  ),
                )),
              ),
      ),
    );
  }

  Widget userNameTF() {
    return CustomFormBuilderTF(
        labelText: 'Username',
        controller: controller.usernameEC,
        isRequired: true,
        name: 'userName');
  }

  Widget nameTF() {
    return CustomFormBuilderTF(
        labelText: 'Name',
        controller: controller.nameEC,
        isRequired: true,
        name: 'name');
  }

  Widget lastnameTF() {
    return CustomFormBuilderTF(
        labelText: 'Lastname',
        controller: controller.lastnameEC,
        isRequired: true,
        name: 'lastname');
  }

  Widget passwordTextField() {
    return CustomFormBuilderTF(
      controller: controller.passwordEC,
      name: 'Password',
      isRequired: true,
      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
      isObsecureText: true,
      labelText: "Password",
    );
  }

  Widget emailTextField() {
    return CustomFormBuilderTF(
        isEmail: true,
        labelText: 'Email',
        controller: controller.emailEC,
        isRequired: true,
        name: 'email');
  }

  Widget signUpButton() {
    return CustomButton(
        onTap: () async {
          if (formKey.currentState!.validate()) {
            await controller.registerRequest();
          }
        },
        buttonText: 'Hesap Olustur',
        buttonColor: CustomColors.black,
        textColor: CustomColors.white);
  }

  Widget customSizedBox(BuildContext context) => SizedBox(
        height: context.dynamicHeight(.02),
      );
}
