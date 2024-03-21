import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/app_image_page.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/app_info_page.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/app_price_page.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/store_url_page.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/upload_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadAppPage extends HookConsumerWidget {
  const UploadAppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final uploadController = ref.watch(uploadAppControllerProvider);

    ref.listen(uploadAppControllerProvider, (previous, next) async {
      if (next.nextPage) {
        await pageController.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      }

      if (next.backPage) {
        await pageController.previousPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリを掲載する'),
      ),
      body: Column(
        children: [
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: uploadController.getProgress,
            ),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              backgroundColor: ColorsConstant.gray,
              color: ColorsConstant.purple,
            ),
          ),
          Expanded(
              child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StoreUrlPage(),
              AppInfoPage(),
              AppImagePage(),
              AppPricePage(),
            ],
            onPageChanged: (value) {
              ref
                  .read(uploadAppControllerProvider.notifier)
                  .setCurrentPage(value);
            },
          ))
        ],
      ),
    );
  }
}
