import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/all_category_model.dart';
import 'package:quizz_flutter/models/answers_model.dart';
import 'package:quizz_flutter/models/selected_question_model.dart';
import 'package:quizz_flutter/models/test_categories_model.dart';

class MyExamsController extends BaseController {
  RxList<Answer> answers = <Answer>[].obs;
  RxList<AllCategory> allCategory = <AllCategory>[].obs;
  RxList<Category> testCategories = <Category>[].obs;

  Rxn<SelectedQuestion> selectedQuestion = Rxn<SelectedQuestion>();

  RxInt clickedCategory = 0.obs;
  RxInt clickedQuestion = 0.obs;
  @override
  void onInit() async {
    await getTestsCategories();
    super.onInit();
  }

  getAnswers() async {
    isLoading.value = true;
    try {
      var request = clickedCategory.value != 0
          ? await userService.answers(categoryId: clickedCategory.value)
          : await userService.answers();
      var response = answersModelFromJson(request);
      if (response.status == true) {
        answers.value = response.data ?? [];
        print(response.data);
      } else {
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .15);
        answers.value = [];
      }
    } catch (e) {
      print('getAnswers hata $e');
    }
    isLoading.value = false;
  }

  getAllCategory() async {
    isLoading.value = true;
    try {
      var request = await userService.allCategory();
      var response = allCategoryModelFromJson(request);
      if (response.status == true) {
        allCategory.value = response.data ?? [];
      } else {
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .15);
        allCategory.value = [];
      }
    } catch (e) {
      print('getAllCategory hata $e');
    }
    isLoading.value = false;
  }

  getTestsCategories() async {
    isLoading.value = true;
    try {
      var request = await userService.testCategories();
      var response = testCategoriesModelFromJson(request);
      if (response.status == true) {
        testCategories.value = response.data ?? [];
      } else {
        showCustomDialog('${response.message}',
            isHaveButton: false, height: Get.height * .15);
        allCategory.value = [];
      }
    } catch (e) {
      print('getTestsCategories hata $e');
    }
    isLoading.value = false;
  }

  getQuestion() async {
    var request = await userService.selectedQuestion(clickedQuestion.value);
    var response = selectedQuestionModelFromJson(request);
    if (response.status == true) {
      selectedQuestion.value = response.data;
    } else {
      selectedQuestion.value = null;
    }
  }
}
