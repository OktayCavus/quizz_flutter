import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/base_controller.dart';
import 'package:quizz_flutter/models/answers_model.dart';
import 'package:quizz_flutter/models/selected_question_model.dart';
import 'package:quizz_flutter/models/user_test_answers_model.dart';
import 'package:quizz_flutter/models/user_tests_model.dart';

class TestScreenController extends BaseController {
  var argumentData = Get.arguments;
  RxInt clickedCategory = 0.obs;
  RxInt clickedTest = 0.obs;

  RxList<UserTests> userTests = <UserTests>[].obs;
  RxList<Answer> answers = <Answer>[].obs;
  RxList<Datum> testAnswers = <Datum>[].obs;

  RxInt clickedQuestion = 0.obs;
  Rxn<SelectedQuestion> selectedQuestion = Rxn<SelectedQuestion>();

  RxInt categoryId = 0.obs;

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

  fetchUserTests() async {
    try {
      isLoading.value = true;
      var request = await userService.getUsersTests(categoryId.value);
      var response = userTestsModelFromJson(request);
      if (response.status == true) {
        userTests.assignAll(response.data!);
      }
    } catch (e) {
      print('hataaaa fetchUserTests $e');
    }
    isLoading.value = false;
  }

  answersTest() async {
    isLoading.value = true;
    try {
      var request = await userService.getUsersAnswersTests(
          clickedCategory.value, clickedTest.value);
      print('cate${clickedCategory.value}');
      print('test${clickedTest.value}');
      var response = userTestsAnswersModelFromJson(request);
      if (response.status == true) {
        testAnswers.value = response.data ?? [];
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

  @override
  void onInit() async {
    super.onInit();
    categoryId.value = argumentData['category_id'];
    await fetchUserTests();
  }
}
