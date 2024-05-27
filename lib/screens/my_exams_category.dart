import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';

class MyExamsCategoryPage extends GetView<MyExamsController> {
  const MyExamsCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriler'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return controller.isLoading.value
              ? controller.loading(context: context)
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.testCategories.length,
                  itemBuilder: (context, index) {
                    final testCategory = controller.testCategories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5.0,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15.0),
                          onTap: () {
                            controller.clickedCategory.value =
                                testCategory.categoryId!;
                            controller.getAnswers();
                            Get.toNamed('/myExams');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.category,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Text(
                                    testCategory.categoryName.toString(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
