import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';

class MyExams extends GetView<MyExamsController> {
  const MyExams({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınavlarım'),
      ),
      body: Obx(
        () {
          return controller.isLoading.value
              ? controller.loading(context: context)
              : controller.answers.isEmpty
                  ? const Center(
                      child: Text('Bu Kategori\'de görüntülenecek cevap yok'),
                    )
                  : ListView.builder(
                      itemCount: controller.answers.length,
                      itemBuilder: (context, index) {
                        final answer = controller.answers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: InkWell(
                            onTap: () async {
                              controller.clickedQuestion.value =
                                  answer.questionId!;
                              await controller.getQuestion();
                              Get.toNamed('/selectedQuestion', arguments: {
                                "selected_option_id": answer.selectedOptionId
                              });
                            },
                            child: Card(
                              color: Colors.grey[200],
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Soru: ${answer.questionText.toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Verilen Cevap: ${answer.optionText}',
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Kategori Türü: ${answer.categoryName}',
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Soru Numarası: ${answer.questionId}',
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Sonuç: ${answer.isCorrect == 1 ? "Doğru" : "Yanlış"}',
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 30.0,
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
        },
      ),
    );
  }
}
