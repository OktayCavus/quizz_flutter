import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/check_code_controller.dart';
import 'package:quizz_flutter/widgets/custom_button.dart';

class CheckPage extends GetView<CheckCodeController> {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Check'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : Padding(
                padding: context.filterPad,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          6,
                          (index) => SizedBox(
                            width: Get.width * .16,
                            height: Get.height * .1,
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: TextField(
                                style: const TextStyle(fontSize: 30),
                                controller: controller.controllers[index],
                                focusNode: controller.focusNodes[index],
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                onChanged: (value) {
                                  controller.handleTextChange(
                                      context, index, value);
                                },
                                onSubmitted: (value) {
                                  if (index < 5) {
                                    controller.focusNodes[index + 1]
                                        .requestFocus();
                                  } else {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      context.heightBox(.08),
                      CustomButton(
                        buttonText: 'Gönder',
                        buttonColor: CustomColors.black,
                        textColor: CustomColors.white,
                        onTap: () async {
                          await controller.checkCodeRequest();
                        },
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: CustomColors.white),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
