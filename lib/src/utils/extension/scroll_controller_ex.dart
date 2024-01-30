import 'package:flutter/material.dart';

extension ScrollControllerEx on ScrollController {
  void scrollToBottom(
      {bool reverse = false,
      Duration duration = const Duration(milliseconds: 200)}) {
    if (hasClients) {
      if (reverse) {
        if (duration == Duration.zero) {
          jumpTo(0);
        } else {
          animateTo(0, duration: duration, curve: Curves.fastOutSlowIn);
        }
      } else {
        if (duration == Duration.zero) {
          jumpTo(position.maxScrollExtent);
        } else {
          animateTo(position.maxScrollExtent,
              duration: duration, curve: Curves.fastOutSlowIn);
        }
      }
    }
  }

  bool isBottom({bool reverse = false}) {
    if (reverse) {
      return position.pixels <= 100;
    } else {
      return position.pixels >= position.maxScrollExtent - 100;
    }
  }
}
