import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quizz',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: 'Roboto'),
      initialBinding: MainBinding(),
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      // initialRoute: MainController().mainFunction(),
      home: LoginPage(),
    );
  }
}
