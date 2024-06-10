import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';
import 'package:quizz_flutter/widgets/custom_card_widget.dart';

class MyExamsCategoryPage extends GetView<MyExamsController> {
  const MyExamsCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriler'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/selectQuiz');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return controller.isLoading.value
                ? controller.loading(context: context)
                : controller.testCategories.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                                'Sınava girdiğiniz bir kategori bulunmamaktadır'),
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.testCategories.length,
                        itemBuilder: (context, index) {
                          final testCategory = controller.testCategories[index];
                          return CustomCard(
                            name: testCategory.categoryName.toString(),
                            icon: Icons.category,
                            onTap: () async {
                              controller.clickedCategory.value =
                                  testCategory.categoryId!;

                              // await controller.getAnswers();
                              // Get.toNamed('/myExams');
                              Get.toNamed('/userTests', arguments: {
                                "category_id": testCategory.categoryId
                              });
                            },
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
