import 'package:app_buy_sell/src/features/login/login_service.dart';
import 'package:app_buy_sell/src/features/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(checkAccountProvider, (previous, next) {
      next.when(
        data: (status) {
          if (status == AccountStatus.profileUnRegistered) {
            context.go('registerProfile');
          } else if (status == AccountStatus.logined) {
            context.go('/home');
          } else {
            context.go('/start');
          }
        },
        error: (Object error, StackTrace stackTrace) {},
        loading: () {},
      );
    });

    return const Scaffold();
  }
}
