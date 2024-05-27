import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';

class SelectedQuestionScreen extends GetView<MyExamsController> {
  const SelectedQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedOptionId = Get.arguments['selected_option_id'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soru ve Cevaplar'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor:
            Colors.black, // AppBar metin rengi siyah olarak ayarlandı
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.selectedQuestion.value == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final question = controller.selectedQuestion.value!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soru: ${question.questionText}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: question.options?.length,
                    itemBuilder: (context, index) {
                      final option = question.options?[index];
                      Color cardColor = Colors.grey[200]!;
                      if (option?.id == selectedOptionId) {
                        if (option?.isCorrect == 1) {
                          cardColor = Colors.green.withOpacity(0.7);
                        } else if (option?.isCorrect == 0) {
                          cardColor = Colors.red.withOpacity(0.7);
                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Card(
                          color: cardColor,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: option?.id == selectedOptionId
                                  ? Colors.black
                                  : Colors.grey,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: option?.id == selectedOptionId
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            title: Text(
                              '${option?.optionText}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
