import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  const Utils._();

  static void dismisKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static DateTime? fromTimestamp(Timestamp? timestamp) => timestamp?.toDate();
  static dynamic toTimestamp(DateTime? time) =>
      time != null ? Timestamp.fromDate(time) : FieldValue.serverTimestamp();

  static void showAlert(
      {Object? error, required BuildContext context, String? content}) {
    final message = content ?? '原因不明のエラーです。時間をおいて再試行してください。';
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static String appstoreUrl(String? appId) {
    if (appId != null) {
      return 'https://apps.apple.com/jp/app/id$appId';
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
