import 'dart:ffi';

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
                  itemCount: controller.allCategory.length,
                  itemBuilder: (context, index) {
                    final allCategory = controller.allCategory[index];
                    return InkWell(
                      child: ListTile(
                        title: Text(allCategory.type.toString()),
                        onTap: () {
                          controller.clickedCategory.value = allCategory.id!;
                          controller.getAnswers();
                          Get.toNamed('/myExams');
                        },
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
