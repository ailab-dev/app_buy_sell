import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  const Utils._();

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showAlertError(
      {required Object error, required BuildContext context}) {
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

  static String appStoreUrl(String? appId) {
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
