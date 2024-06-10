import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/test_screen_controller.dart';
import 'package:quizz_flutter/widgets/custom_card_widget.dart';

class TestsScreenPage extends GetView<TestScreenController> {
  const TestsScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await controller.answersTest();
        }),
        appBar: AppBar(
          title: const Text('Testlerim'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? controller.loading(context: context)
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.userTests.length,
                  itemBuilder: (context, index) {
                    final testCategory = controller.userTests[index];
                    return CustomCard(
                      name: 'Test ${index + 1}',
                      icon: Icons.category,
                      onTap: () async {
                        controller.clickedCategory.value =
                            testCategory.categoryId!;
                        controller.clickedTest.value = testCategory.testId!;

                        // await controller.getAnswers();
                        await controller.answersTest();
                        Get.toNamed('/myExams');
                      },
                    );
                  },
                ),
        ));
  }
}
