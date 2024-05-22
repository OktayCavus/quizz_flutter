import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';
import 'package:quizz_flutter/controllers/login_controller.dart';

class CustomFormBuilderTF extends StatefulWidget {
  const CustomFormBuilderTF({
    super.key,
    this.textType,
    required this.controller,
    this.hintText,
    required this.isRequired,
    this.onChanged,
    this.isObsecureText,
    required this.name,
    this.isEmail,
    this.isLongTextField,
    this.hintStyle,
    this.labelText,
    this.isPassword,
  });

  final TextInputType? textType;
  final TextEditingController controller;
  final String? hintText;
  final bool isRequired;
  final Function? onChanged;

  final bool? isObsecureText;
  final bool? isEmail;
  final bool? isLongTextField;
  final TextStyle? hintStyle;
  final String name;

  final String? labelText;
  final bool? isPassword;

  @override
  State<CustomFormBuilderTF> createState() => _CustomFormBuilderTFState();
}

class _CustomFormBuilderTFState extends State<CustomFormBuilderTF> {
  final _loginController = Get.find<LoginController>();

  List<String> suggestions = ['hotmail.com', 'outlook.com', 'gmail.com'];
  String emailSuggestion = '';
  @override
  Widget build(BuildContext context) {
    final bool longTextField = widget.isLongTextField ?? false;
    final bool obsecureText = widget.isObsecureText ?? false;
    final bool isPasswordd = widget.isPassword ?? false;
    final mail = widget.isEmail ?? false;
    return FormBuilderTextField(
      name: widget.name,
      obscureText: obsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: widget.textType,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!();
        }
        if (mail) {
          if (value!.contains('@')) {
            switch (value.split('@')[1]) {
              case 'h':
                setState(() {
                  emailSuggestion = 'hotmail.com';
                  value = value! + emailSuggestion;
                });
                break;
              case 'o':
                setState(() {
                  emailSuggestion = 'outlook.com';
                  value = value! + emailSuggestion;
                });
                break;
              case 'g':
                setState(() {
                  emailSuggestion = 'gmail.com';
                  value = value! + emailSuggestion;
                });
                break;

              default:
                setState(() {
                  emailSuggestion = '';
                });
            }
          }
        } else {
          setState(() {
            emailSuggestion = '';
          });
        }
      },
      maxLines: longTextField ? 7 : 1,
      decoration: InputDecoration(
        suffix: emailSuggestion.isNotEmpty
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget.controller.text = widget.controller.text
                            .substring(0, widget.controller.text.length - 1) +
                        emailSuggestion;

                    widget.controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.controller.text.length));
                  });
                },
                child: Text(
                  emailSuggestion,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            : null,
        suffixIcon: isPasswordd
            ? Obx(
                () => InkWell(
                    onTap: () {
                      _loginController.obsecureText.value =
                          !_loginController.obsecureText.value;
                    },
                    child: !_loginController.obsecureText.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
              )
            : const SizedBox.shrink(),
        labelText: widget.labelText,
        hintStyle: widget.hintStyle,
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.textFieldFillColor),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        fillColor: CustomColors.textFieldFillColor,
        filled: true,
        contentPadding: const EdgeInsets.all(16),
      ),
      validator: widget.isRequired
          ? FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              if (widget.isEmail == true) FormBuilderValidators.email(),
            ])
          : null,
    );
  }
}
