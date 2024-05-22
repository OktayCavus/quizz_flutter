import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}

extension PaddingExtension on BuildContext {
  Widget heightBox(double h) => SizedBox(
        height: dynamicHeight(h),
      );

  SizedBox widthBox(double w) => SizedBox(
        width: dynamicWidth(w),
      );

  EdgeInsets get loginHorAndVerPad => EdgeInsets.only(
        left: dynamicWidth(.07),
        right: dynamicWidth(.07),
        top: dynamicHeight(.05),
        bottom: dynamicHeight(0.02),
      );

  EdgeInsets get questionTextHorAndVerPad => EdgeInsets.only(
        left: dynamicWidth(.02),
        right: dynamicWidth(.02),
        top: dynamicHeight(.05),
        bottom: dynamicHeight(0.02),
      );

  EdgeInsets get filterPad => EdgeInsets.symmetric(
        horizontal: dynamicWidth(.02),
      );
}
