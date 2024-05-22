import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/my_profile_controller.dart';
import 'package:quizz_flutter/models/my_profile_model.dart';

class ProfileInfoWidget extends StatelessWidget {
  final MyProfileModel? userData;

  ProfileInfoWidget({super.key, required this.userData});

  final MyProfileController _myProfileController =
      Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Kullanıcı Adı", userData?.data?.username ?? "",
            _myProfileController.userNameEC, 'username',
            readOnly: _myProfileController.isChangingEmail.value),
        _buildInfoRow("Ad", userData?.data?.name ?? "",
            _myProfileController.nameEC, 'name',
            readOnly: _myProfileController.isChangingEmail.value),
        _buildInfoRow("Soyad", userData?.data?.lastname ?? "",
            _myProfileController.lastnameEC, 'lastname',
            readOnly: _myProfileController.isChangingEmail.value),
        Obx(
          () => _buildInfoRow("E-posta", userData?.data?.email ?? "",
              _myProfileController.emailEC, 'email',
              readOnly: !_myProfileController.isChangingEmail.value,
              focusNode: _myProfileController.emailFocusNode),
        ),
        _buildInfoRow("Kayıt Tarihi", _parseDate(userData?.data?.createdAt),
            _myProfileController.createdEC, 'created_at',
            readOnly: _myProfileController.isStabilRead.value),
        _buildInfoRow(
            "Güncelleme Tarihi",
            _parseDate(userData?.data?.updatedAt),
            _myProfileController.updatedEC,
            'updated_at',
            readOnly: _myProfileController.isStabilRead.value),
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    TextEditingController? controller,
    String tag, {
    bool? readOnly,
    FocusNode? focusNode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            flex: 2,
            child: readOnly != null && readOnly
                ? TextFormField(
                    initialValue: value,
                    readOnly: readOnly,
                  )
                : Obx(
                    () => TextFormField(
                      initialValue: value,
                      focusNode: focusNode,
                      readOnly: _myProfileController.isRead.value,
                      onChanged: (newValue) {
                        if (controller != null) {
                          controller.text = newValue;
                          _myProfileController.isChanged.value = true;
                          _myProfileController.updateField(tag, newValue);
                        }
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }

  String _parseDate(DateTime? date) {
    if (date == null) return '';
    return "${date.day}/${date.month}/${date.year}";
  }
}
