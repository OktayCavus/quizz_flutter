import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/padding.dart';
import 'package:quizz_flutter/controllers/question_controller.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.showCustomDialog(
              'Sınavı bitirmek üzeresiniz ?',
              description:
                  'Sınavdan çıkmayı kabul ediyor musunuz ? Cevaplarınız kayıt edilmeyecektir',
              confirmButtonText: 'Çık',
              onTap1: () {
                Get.offAllNamed('/selectQuiz');
              },
              onTap2: () {
                Get.back();
              },
              height: Get.height * .27,
            );
          },
        ),
        centerTitle: true,
        title: Obx(() => Text(controller.timerString)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.isLoading.value
              ? controller.loading(context: context)
              : ListView.builder(
                  itemCount: controller.questions.length,
                  itemBuilder: (context, questionIndex) {
                    final question = controller.questions[questionIndex];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
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
                          context.heightBox(.01),
                          ...question.options!.map((option) {
                            int optionIndex = question.options!.indexOf(option);
                            Color cardColor = Colors.grey[200]!;

                            bool isSelected = controller.selectedAnswers.any(
                              (answer) =>
                                  answer['question_id'] ==
                                      question.questionId &&
                                  answer['selected_option_id'] ==
                                      option.optionId,
                            );

                            if (isSelected) {
                              cardColor = Colors.blue[200]!;
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
                                  onTap: () {
                                    controller.setSelectedAnswers(
                                        question.questionId!, option.optionId!);

                                    controller.page.value++;
                                    controller.getQuestions();
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Text(
                                      String.fromCharCode(65 + optionIndex),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    option.optionText!,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }),
                          context.heightBox(.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: controller.isHaveQuestion.value
                                    ? () {
                                        if (controller.page.value > 1) {
                                          controller.page.value--;
                                          controller.getQuestions();
                                        }
                                      }
                                    : () {
                                        controller.page.value =
                                            controller.page.value - 2;
                                        controller.getQuestions();
                                      },
                                child: const Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 75,
                                ),
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: controller.isHaveQuestion.value
                                      ? () {
                                          controller.page.value++;
                                          controller.getQuestions();
                                        }
                                      : () async {
                                          // ! buraya sorular bitti artık servis'e yollayacağız elimizdeki verileri
                                          await controller.submitAnswer();
                                        },
                                  child: controller.isHaveQuestion.value
                                      ? const Icon(
                                          Icons.arrow_circle_right_outlined,
                                          size: 75)
                                      : const Icon(
                                          Icons.check_circle_outline,
                                          size: 75,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
