import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:app_buy_sell/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Utils.dismisKeyboard(context);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'ログイン',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'メールアドレス',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                    ),
                    fillColor: ColorsConstant.gray,
                    filled: true,
                    hintText: 'your-email@prodhub.com',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: ColorsConstant.gray2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'パスワード',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                    ),
                    fillColor: ColorsConstant.gray,
                    filled: true,
                    hintText: '小文字・大文字・数字を含めた8桁以上',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: ColorsConstant.gray2,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(ColorsConstant.text),
                    ),
                    child: const Text(
                      'ログインする',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
