import 'package:quizz_flutter/controllers/base_controller.dart';

class MainController extends BaseController {
  mainFunction() {
    if (storageBox.read('accessToken') != null) {
      return 'selectQuiz';
    } else {
      return 'login';
    }
  }
}
