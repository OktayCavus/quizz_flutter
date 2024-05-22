import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';

class MyExams extends GetView<MyExamsController> {
  const MyExams({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () {
          return controller.isLoading.value
              ? controller.loading(context: context)
              : ListView.builder(
                  itemCount: controller.answers.length,
                  itemBuilder: (context, index) {
                    final answer = controller.answers[index];
                    return controller.answers.isEmpty
                        ? const Center(
                            child: Text(
                                'Bu Kategori\'de görüntülenecek cevap yok'),
                          )
                        : ListTile(
                            title:
                                Text('Soru: ${answer.questionText.toString()}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Verilen Cevap: ${answer.optionText}'),
                                Text('Kategori Türü: ${answer.categoryName}'),
                                Text('Soru Numarası : ${answer.questionId}'),
                                Text(
                                    'Doğru/Yanlış: ${answer.isCorrect == 1 ? "Yes" : "No"}'),
                              ],
                            ),
                          );
                  },
                );
        },
      ),
    );
  }
}
