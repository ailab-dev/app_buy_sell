import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseViewModel extends ChangeNotifier {
  final errorSubject = PublishSubject<Object>();
  var isLoading = false;
  var _disposed = false;

  void addError(Object e) {
    debugPrint(e.toString());
    if (errorSubject.isClosed) {
      return;
    }
    errorSubject.add(e);
  }

  @override
  void dispose() {
    super.dispose();
    errorSubject.close();
    _disposed = true;
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
