import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_profile_controller.dart';

class MyProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyProfileController());
  }
}
