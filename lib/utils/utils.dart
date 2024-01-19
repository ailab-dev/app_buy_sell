
import 'package:flutter/widgets.dart';

class Utils {
  const Utils._();

  static void dismisKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
