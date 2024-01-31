import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  static void showAlertError({Object? error, required BuildContext context}) {
    String? content;
    if (error is FirebaseAuthException) {
      if (error.code == 'INVALID_LOGIN_CREDENTIALS' ||
          error.code == 'wrong-password') {
        content = 'メールアドレスまたはパスワードが間違っています。';
      } else if (error.code == 'email-already-in-use') {
        content = 'メールが使用されました。';
      } else if (error.code == 'invalid-email') {
        content = 'メール アドレスの形式が正しくありません。';
      }
    }
    final message = content ?? '原因不明のエラーです。時間をおいて再試行してください。';
    showAlert(context, message);
  }

  static void showAlert(BuildContext context, String message) {
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
}
