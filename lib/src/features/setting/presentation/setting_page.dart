import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '設定',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsConstant.text,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '設定とプライバシー',
                style: _titleStyle(),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'プッシュ通知設定',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'サポート',
                style: _titleStyle(),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        '運営からのお知らせ',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'お問い合わせ',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'アプリの不具合・改善要望を報告する',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'その他',
                style: _titleStyle(),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'プライバシーポリシー',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        '利用規約',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'ログアウト',
                          style: _subTitleStyle(),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsConstant.gray2,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        '退会手続き',
                        style: _subTitleStyle(),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsConstant.gray2,
                  ),
                ],
              ),
              const Divider(
                color: ColorsConstant.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _titleStyle() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: ColorsConstant.text,
    );
  }

  TextStyle _subTitleStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorsConstant.text,
    );
  }
}
