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
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(),
      body: FutureBuilder(
        future: controller.getAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return controller.loading(context: context);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: context.loginHorAndVerPad,
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height * 0.15,
                        child: Text(
                          'Quizz\'e hoşgeldin ${controller.name.toUpperCase()}',
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      context.heightBox(.1),
                      Obx(
                        () => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.7,
                          ),
                          itemCount: controller.allCategory.length,
                          itemBuilder: (context, index) {
                            var category = controller.allCategory[index];
                            return CustomAnswerButton(
                              text: category.type ?? '',
                              onTap: () {
                                controller.storageBox
                                    .write('selectedCategoryId', category.id);
                                Get.toNamed('/listTestScreen');
                              },
                              width: Get.width,
                            );
                          },
                        ),
                      ),
                      context.heightBox(.1),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
