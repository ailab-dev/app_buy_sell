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

  static String appstoreUrl(String? appId) {
    if (appId != null) {
      return 'https://apps.apple.com/jp/app/facebook/id$appId';
    }
    return '';
  }

  static String googlePlayUrl(String? appId) {
    if (appId != null) {
      return 'https://play.google.com/store/apps/details?id=$appId';
    }
    return '';
  }
}
