import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/select_quiz_controller.dart';
import 'package:quizz_flutter/widgets/custom_answer_button.dart';
import 'package:quizz_flutter/widgets/drawer_widget.dart';

class SelectQuizView extends GetView<SelectQuizController> {
  const SelectQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    // String? name = Get.arguments['name'];
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(),
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: context.loginHorAndVerPad,
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.15,
                          child: const Text(
                            // 'Quizz\'e hoşgeldin $name',
                            'Quizz\'e hoşgeldin ',

                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                        context.heightBox(.1),
                        Column(
                          children: [
                            Row(
                              children: [
                                CustomAnswerButton(
                                  icon: Icons.headphones_rounded,
                                  text: 'Listening',
                                  onTap: () {},
                                  topRight: 0,
                                  bottomLeft: 0,
                                  bottomRight: 0,
                                ),
                                CustomAnswerButton(
                                  icon: Icons.menu_book_outlined,
                                  text: 'Reading',
                                  onTap: () {},
                                  topLeft: 0,
                                  bottomLeft: 0,
                                  bottomRight: 0,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomAnswerButton(
                                  icon: Icons.create,
                                  text: 'Writing',
                                  onTap: () {},
                                  topRight: 0,
                                  topLeft: 0,
                                  bottomRight: 0,
                                ),
                                CustomAnswerButton(
                                  icon: Icons.mic,
                                  text: 'Speaking',
                                  onTap: () {},
                                  topRight: 0,
                                  topLeft: 0,
                                  bottomLeft: 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        context.heightBox(.1),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
