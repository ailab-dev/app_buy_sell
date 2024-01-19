import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/screen/login/login_page.dart';
import 'package:app_buy_sell/screen/register/register_page.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.logo.svg(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('AppBuySellのキャッチコピーが入ります')
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            width: double.infinity,
            height: 54,
            child: TextButton(
              onPressed: () {
                Navigation.push(context, const RegisterPage());
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(ColorsConstant.text),
              ),
              child: const Text(
                'AppBuySellを始める',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            width: double.infinity,
            height: 54,
            child: TextButton(
              onPressed: () {
                Navigation.push(context, const LoginPage());
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: const BorderSide(
                      color: ColorsConstant.placeholder,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text(
                'ログイン',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorsConstant.text,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
