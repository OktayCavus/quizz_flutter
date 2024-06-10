import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_2_controller.dart';

class MyExams2Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyExams2Controller());
  }
}
