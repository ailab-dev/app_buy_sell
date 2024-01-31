import 'package:flutter/material.dart';

class AppStyle {
  const AppStyle._();

  static ButtonStyle buttonStyleZero({Color? backgroundColor}) {
    return TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: backgroundColor,
    );
  }
}
