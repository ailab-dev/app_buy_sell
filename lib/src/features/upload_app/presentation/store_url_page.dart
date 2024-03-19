import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/upload_app_controller.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreUrlPage extends HookConsumerWidget {
  const StoreUrlPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Utils.dismissKeyboard(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'あなたの作成したアプリを掲載しましょう！\n多くのユーザーに知ってもらえるきっかけになります。\nまた、金額設定することで売却することも可能です。',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Storeリンク',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'https://apps.apple.com/jp/app/example',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorsConstant.gray2,
                ),
                fillColor: ColorsConstant.gray,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '※AppleStore上でのURLを入力してください',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: ColorsConstant.gray3,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 54,
                child: TextButton(
                  onPressed: () {
                    ref.read(uploadAppControllerProvider.notifier).nextPage();
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
                    'アプリ登録申請をする',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
