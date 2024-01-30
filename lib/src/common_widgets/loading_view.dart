import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.child,
    this.progressIndicator = const CircularProgressIndicator(
      color: Colors.white,
    ),
    this.color = Colors.black,
    this.opacity = 0.5,
    required this.isLoading,
  });

  final Widget child;

  final Widget progressIndicator;

  final Color color;

  final double opacity;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          ModalBarrier(
            dismissible: false,
            color: color.withOpacity(opacity),
          ),
          Center(
            child: progressIndicator,
          ),
        ]
      ],
    );
  }
}
