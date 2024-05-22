import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_exams_controller.dart';

class MyExamsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyExamsController());
  }
}
