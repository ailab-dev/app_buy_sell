import 'package:app_buy_sell/base/base_screen.dart';
import 'package:app_buy_sell/screen/home/home_page.dart';
import 'package:app_buy_sell/screen/register_profile/register_profile_page.dart';
import 'package:app_buy_sell/screen/splash/splash_view_model.dart';
import 'package:app_buy_sell/screen/start/start_page.dart';
import 'package:app_buy_sell/service/login_service.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseScreen<SplashPage, SplashViewModel> {
  @override
  void onViewReady() {
    super.onViewReady();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future<void> checkStatus() async {
    final status = await viewModel.checkAccount();
    if (mounted) {
      if (status == AccountStatus.profileUnRegistered) {
        Navigation.pushAndRemoveUntil(context, const StartPage());
      } else {
        Navigation.pushAndRemoveUntil(context, const StartPage());
      }
    }
  }
}
