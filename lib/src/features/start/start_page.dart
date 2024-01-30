import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/login/presentation/login_page.dart';
import 'package:app_buy_sell/src/features/register/presentation/register_page.dart';
import 'package:app_buy_sell/src/utils/navigation.dart';
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
                  Assets.images.logoPng.image(width: 290),
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
          const SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
