import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizz_flutter/bindings/login_binding.dart';
import 'package:quizz_flutter/bindings/main_binding.dart';
import 'package:quizz_flutter/controllers/main_controller.dart';
import 'package:quizz_flutter/routings/routing.dart';
import 'package:quizz_flutter/screens/login_page.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: false,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: MainBinding(),
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      // initialRoute: MainController().mainFunction(),
      home: LoginPage(),
    );
  }
}
