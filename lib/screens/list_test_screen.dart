import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/list_test_controller.dart';
import 'package:quizz_flutter/widgets/custom_card_widget.dart';

class ListTestScreen extends GetView<ListTestController> {
  const ListTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => controller.isLoading.value
            ? controller.loading(context: context)
            : Text('${controller.testList.value?.category?.type}')),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? controller.loading(context: context)
            : SingleChildScrollView(
                child: controller.testList.value?.tests?.isEmpty ?? true
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Bu kategoriye ait test bulunamadı',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            controller.testList.value?.category?.testCount ?? 0,
                        itemBuilder: (context, index) {
                          var test = controller.testList.value?.tests?[index];
                          return CustomCard(
                              name: 'Test ${index + 1}',
                              onTap: () {
                                controller.showCustomDialog('Hazır mısın?',
                                    confirmButtonText: 'Onayla',
                                    description:
                                        'Sınav başlıyor. Süreniz 30 dakikadır.',
                                    onTap1: () {
                                  Get.back();
                                  controller.storageBox
                                      .write('testId', test?.id);
                                  Get.toNamed('/questionScreen');
                                }, onTap2: () {
                                  Get.back();
                                });
                              });
                        },
                      ),
              ),
      ),
    );
  }
}
