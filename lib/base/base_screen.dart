import 'dart:async';

import 'package:app_buy_sell/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

abstract class BaseScreen<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> with ScopeStateMixin {
  late VM viewModel;

  bool vmScoped = false;

  StreamSubscription<User?>? subscription;

  @override
  void initState() {
    if (vmScoped) {
      viewModel = currentScope.get<VM>();
    } else {
      viewModel = get<VM>();
    }
    super.initState();
    viewModel.errorSubject.listen((error) {
      showError(error);
    });

    subscription = FirebaseAuth.instance.authStateChanges().listen((event) {
      authStateChanges();
    });
    onViewReady();
  }

  @protected
  void onViewReady() {}

  @protected
  void authStateChanges() {}

  void showError(Object? e, {bool authView = false}) {
    if (!mounted) {
      return;
    }
    var message = '原因不明のエラーです。時間をおいて再試行してください。';
    if (e is FirebaseAuthException && e.message != null) {
      message = e.message!;
    }
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

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
