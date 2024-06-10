import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/question_controller.dart';

class QuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController());
  }
}
