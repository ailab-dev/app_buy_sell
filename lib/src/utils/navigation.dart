import 'package:flutter/material.dart';

class Navigation {
  const Navigation._();

  static Future<T?> push<T extends Object?>(
      BuildContext context, Widget nextPage) async {
    return await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return nextPage;
      },
    ));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget nextPage) {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextPage,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  static Future<T?> present<T extends Object?>(
      BuildContext context, Widget nextPage) async {
    return await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;

          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  static Future<T?> pushReplacement<T extends Object?>(
      BuildContext context, Widget nextPage,
      {bool animation = false}) async {
    return await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextPage,
        transitionDuration:
            animation ? const Duration(milliseconds: 300) : Duration.zero,
        reverseTransitionDuration:
            animation ? const Duration(milliseconds: 300) : Duration.zero,
      ),
    );
  }

  static showModal(BuildContext context,
      {required ScrollableWidgetBuilder builder}) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return DraggableScrollableSheet(
          builder: builder,
          initialChildSize: 1,
          maxChildSize: 1,
          minChildSize: 1,
          expand: false,
        );
      },
    );
  }

  static popRoot(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
