import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_flutter/constants/color_images_constant.dart';

class CustomTextStyle {
  static TextStyle inputAboveText() {
    return GoogleFonts.poppins(
        fontSize: 15, color: CustomColors.black, fontWeight: FontWeight.w600);
  }

  static TextStyle buttonText({Color? textColor}) {
    return GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor ?? CustomColors.white);
  }

  static TextStyle cardTitleText() {
    return GoogleFonts.poppins(
        fontSize: 17, fontWeight: FontWeight.w700, color: CustomColors.black);
  }

  static TextStyle cardDescText() {
    return GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: CustomColors.black);
  }

  static TextStyle boldRegisterAndLoginText() {
    return GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.bold, color: CustomColors.black);
  }

  static TextStyle cardButtonText() {
    return GoogleFonts.poppins(
        fontSize: 11, fontWeight: FontWeight.bold, color: CustomColors.white);
  }

  static TextStyle hardText1() {
    return GoogleFonts.poppins(
        fontSize: 28, fontWeight: FontWeight.bold, color: CustomColors.black);
  }

  static TextStyle hardText2() {
    return GoogleFonts.poppins(
        fontSize: 17, fontWeight: FontWeight.w600, color: CustomColors.black);
  }

  static TextStyle priceText() {
    return GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w600, color: CustomColors.black);
  }

  static TextStyle pageAppBarText() {
    return GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.bold, color: CustomColors.black);
  }

  static TextStyle addProductCardText() {
    return GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.bold, color: CustomColors.black);
  }

  static TextStyle dialogMainText() {
    return GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w700, color: CustomColors.black);
  }

  static TextStyle dialogDescText({Color? color}) {
    return GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color ?? CustomColors.black);
  }

  static TextStyle showCountryText() {
    return GoogleFonts.poppins(
        fontSize: 17, color: CustomColors.black, fontWeight: FontWeight.w600);
  }

  static TextStyle detailsTitleText() {
    return GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w700, color: CustomColors.black);
  }

  static TextStyle detailsText() {
    return GoogleFonts.poppins(
        fontSize: 13, fontWeight: FontWeight.normal, color: CustomColors.black);
  }

  static TextStyle categoriesAndTagsConclusion() {
    return GoogleFonts.poppins(
        fontSize: 13, fontWeight: FontWeight.w600, color: CustomColors.black);
  }

  static TextStyle listViewCardText() {
    return GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w500, color: CustomColors.black);
  }
}
