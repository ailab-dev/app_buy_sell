import 'package:app_buy_sell/screen/home/home_page.dart';
import 'package:app_buy_sell/screen/register_profile/register_profile_page.dart';
import 'package:app_buy_sell/screen/splash/splash_provider.dart';
import 'package:app_buy_sell/screen/start/start_page.dart';
import 'package:app_buy_sell/service/login_service.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void checkStatus() async {
    await Future.delayed(const Duration(seconds: 0));
    final status = await ref.watch(checkAccountProvider.future);
    if (mounted) {
      if (status == AccountStatus.profileUnRegistered) {
        Navigation.pushAndRemoveUntil(context, const RegisterProfilePage());
      } else if (status == AccountStatus.logined) {
        Navigation.pushAndRemoveUntil(context, const HomePage());
      } else {
        Navigation.pushAndRemoveUntil(context, const StartPage());
      }
    }
  }
}
