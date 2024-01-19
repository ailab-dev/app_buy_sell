import 'package:app_buy_sell/screen/register_profile/register_profile.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:app_buy_sell/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    'AppBuySellをはじめる',
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
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(text: '', children: [
                      TextSpan(
                        text: '利用規約',
                        style: const TextStyle(
                          color: ColorsConstant.purple,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                      const TextSpan(
                        text: '及び',
                        style: TextStyle(
                          color: ColorsConstant.text,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'プライバシーポリシー',
                        style: const TextStyle(
                          color: ColorsConstant.purple,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                      const TextSpan(
                        text: 'に同意の上、ご登録へお進みください。',
                        style: TextStyle(
                          color: ColorsConstant.text,
                          fontSize: 12,
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: TextButton(
                    onPressed: () {
                      Navigation.push(context, const RegisterProfilePage());
                    },
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
                      '新規登録してはじめる',
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