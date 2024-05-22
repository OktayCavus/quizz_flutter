import 'package:flutter/cupertino.dart';

enum GapEnum {
  xS(8),
  S(16),
  N(24),
  M(30),
  L(48),
  xL(64),
  xxl(96),
  ;

  Widget get heightBox => SizedBox(
        height: value,
      );

  SizedBox get widthBox => SizedBox(
        width: value,
      );

  const GapEnum(this.value);

  final double value;
}
