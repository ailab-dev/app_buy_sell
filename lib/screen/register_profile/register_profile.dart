import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:app_buy_sell/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterProfilePage extends StatefulWidget {
  const RegisterProfilePage({super.key});

  @override
  State<RegisterProfilePage> createState() => _RegisterProfilePageState();
}

class _RegisterProfilePageState extends State<RegisterProfilePage> {
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
                    'プロフィール登録',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                const Center(
                  child: Text(
                    '新規会員登録していただきありがとうございます。\nプロフィールを入力してAppBuySellを始めましょう！\n※登録後もプロフィール編集は可能です。',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorsConstant.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'ユーザーネーム',
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
                    hintText: '田中太郎',
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
                      'プロフィールを保存する',
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
