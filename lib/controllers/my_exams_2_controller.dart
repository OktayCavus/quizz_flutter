import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/answers_model.dart';
import 'package:quizz_flutter/models/selected_question_model.dart';

class MyExams2Controller extends BaseController {
  var arguementData = Get.arguments;
  RxList<Answer> answers = <Answer>[].obs;

  RxInt clickedQuestion = 0.obs;
  Rxn<SelectedQuestion> selectedQuestion = Rxn<SelectedQuestion>();
  RxInt clickedCategory = 0.obs;

  getAnswers() async {
    isLoading.value = true;
    try {
      var request = clickedCategory.value != 0
          ? await userService.answers(categoryId: clickedCategory.value)
          : await userService.answers();
      var response = answersModelFromJson(request);
      if (response.status == true) {
        answers.value = response.data ?? [];
      } else {
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .2);
        answers.value = [];
      }
    } catch (e) {
      print('getAnswers hata $e');
    }
    isLoading.value = false;
  }

  getQuestion() async {
    var request = await userService.selectedQuestion(clickedQuestion.value);
    var response = selectedQuestionModelFromJson(request);
    if (response.status == true) {
      selectedQuestion.value = response.data;
    } else {
      showCustomDialog('${response.message}',
          isHaveButton: false, height: Get.height * .2);
      selectedQuestion.value = null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    clickedCategory.value = arguementData['category_id'];
  }
}
