import 'package:get/get.dart';
import 'package:quizz_flutter/bindings/check_code_binding.dart';
import 'package:quizz_flutter/bindings/forget_password_binding.dart';
import 'package:quizz_flutter/bindings/login_binding.dart';
import 'package:quizz_flutter/bindings/my_exams_binding.dart';
import 'package:quizz_flutter/bindings/my_profile_binding.dart';
import 'package:quizz_flutter/bindings/reset_password_binding.dart';
import 'package:quizz_flutter/bindings/select_quiz_binding.dart';
import 'package:quizz_flutter/bindings/sign_up_binding.dart';
import 'package:quizz_flutter/screens/check_code_page.dart';
import 'package:quizz_flutter/screens/forget_password_page.dart';
import 'package:quizz_flutter/screens/my_exams.dart';
import 'package:quizz_flutter/screens/my_exams_category.dart';
import 'package:quizz_flutter/screens/my_profile_page.dart';
import 'package:quizz_flutter/screens/reset_password_page.dart';
import 'package:quizz_flutter/screens/select_quiz_page.dart';
import 'package:quizz_flutter/screens/login_page.dart';
import 'package:quizz_flutter/screens/sign_up.dart';

appRoutes() => [
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: '/signUp',
        page: () => SignUp(),
        binding: SignUpBinding(),
      ),
      GetPage(
        name: '/forgetPassword',
        page: () => ForgetPasswordView(),
        binding: ForgetPasswordBinding(),
      ),
      GetPage(
        name: '/selectQuiz',
        page: () => const SelectQuizView(),
        binding: SelectQuizBinding(),
      ),
      GetPage(
        name: '/checkCode',
        page: () => const CheckPage(),
        binding: CheckCodeBinding(),
      ),
      GetPage(
        name: '/resetPassword',
        page: () => ResetPasswordView(),
        binding: ResetPasswordBinding(),
      ),
      GetPage(
        name: '/myProfile',
        page: () => const MyProfilePage(),
        binding: MyProfileBinding(),
      ),
      GetPage(
        name: '/myExamsCategory',
        page: () => const MyExamsCategoryPage(),
        binding: MyExamsBinding(),
      ),
      GetPage(
        name: '/myExams',
        page: () => const MyExams(),
      )
    ];
