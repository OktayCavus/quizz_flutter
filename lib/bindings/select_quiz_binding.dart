import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/select_quiz_controller.dart';

class SelectQuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SelectQuizController());
  }
}
