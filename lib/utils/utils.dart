import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Utils {
  const Utils._();

  static void dismisKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static DateTime? fromTimestamp(Timestamp? timestamp) => timestamp?.toDate();
  static dynamic toTimestamp(DateTime? time) =>
      time != null ? Timestamp.fromDate(time) : FieldValue.serverTimestamp();
}
