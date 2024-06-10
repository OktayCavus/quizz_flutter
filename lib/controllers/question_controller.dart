import 'dart:async';

import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/list_questions.model.dart';
import 'package:quizz_flutter/models/submit_answers_model.dart';

class QuestionController extends BaseController {
  RxInt start = 1800.obs;
  late Timer _timer;

  RxList<Questions> questions = <Questions>[].obs;
  RxInt page = 1.obs;

  RxInt testId = 0.obs;
  RxInt categoryId = 0.obs;

  RxBool isHaveQuestion = true.obs;

  RxList<Map<String, int>> selectedAnswers = <Map<String, int>>[].obs;

  submitAnswer() async {
    showCustomDialog('Sınavı Kaydet', confirmButtonText: 'Kaydet',
        onTap1: () async {
      try {
        var response = await userService.submitAnswers(
            testId.value, categoryId.value, selectedAnswers);

        if (response['status'] == true) {
          Get.close(0);
          showCustomDialog('${response['message']}',
              isHaveButton: false, height: Get.height * .25);

          await Future.delayed(const Duration(milliseconds: 1500));
          Get.offAllNamed('/selectQuiz');
        } else {
          showCustomDialog('${response['message']}', isHaveButton: true);
        }
      } catch (e) {
        print('submitAnswer request $e');
      }
    }, onTap2: () {
      Get.back();
    });
  }

  void setSelectedAnswers(int questionId, int selectedOptionId) {
    bool answerExists = false;

    for (var answer in selectedAnswers) {
      if (answer['question_id'] == questionId) {
        answer['selected_option_id'] = selectedOptionId;
        answerExists = true;
        break;
      }
    }

    if (!answerExists) {
      selectedAnswers.add({
        'question_id': questionId,
        'selected_option_id': selectedOptionId,
      });
    }

    print(selectedAnswers.toList());
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  String get timerString {
    int minutes = start.value ~/ 60;
    int seconds = start.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  getQuestions() async {
    try {
      isLoading.value = true;
      var request =
          await userService.getListQuestionTest(testId.value, page: page.value);
      var response = listQuestionsModelFromJson(request);
      if (response.status == true) {
        questions.assignAll(response.data ?? []);
        isHaveQuestion.value = true;
      } else {
        isHaveQuestion.value = false;
      }
    } catch (e) {
      print('hata get questions $e');
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    startTimer();
    testId.value = storageBox.read('testId');
    categoryId.value = storageBox.read('selectedCategoryId');
    getQuestions();
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
