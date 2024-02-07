import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseCompletePage extends ConsumerWidget {
  const PurchaseCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            '購入が完了しました',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: ColorsConstant.text,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'おめでとうございます！アプリの購入が完了しました。アプリ権限移譲も完了しましたので、あなたは「テストアプリ」のオーナーになりました。',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Assets.images.purchase.svg(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: SizedBox(
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
                  'マイページで確認する',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
