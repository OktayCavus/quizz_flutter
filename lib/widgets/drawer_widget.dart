import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/controllers/select_quiz_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final SelectQuizController _selectQuizController =
      Get.find<SelectQuizController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(imagePath('quizz')),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profilim'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/myProfile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz_outlined),
            title: const Text('Sınavlarım'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/myExamsCategory');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış yap'),
            onTap: () async {
              Navigator.pop(context);
              await _selectQuizController.logoutRequest();
            },
          ),
        ],
      ),
    );
  }
}
