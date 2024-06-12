import 'dart:io';

import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/upload_app/presentation/upload_app_controller.dart';
import 'package:app_buy_sell/src/utils/theme/app_style.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppImagePage extends HookConsumerWidget {
  const AppImagePage({super.key, this.appModel});
  final AppModel? appModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadController = ref.watch(uploadAppControllerProvider(appModel));
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'STEP2/3',
                      style: TextStyle(
                        color: ColorsConstant.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'アプリのイメージ画像を設定してください',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsConstant.text),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'アプリアイコン',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _avatarImage(uploadController.avatarPath),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(
                                          uploadAppControllerProvider(appModel)
                                              .notifier)
                                      .setAvatar();
                                },
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: ColorsConstant.text,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  '画像を選択してください',
                                  style: TextStyle(
                                    color: ColorsConstant.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Text(
                                'サイズ：240×240 最大サイズ：2MB\n画像形式：JPG・PNG・GIF',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConstant.gray3,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'スクリーンショット',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '最初の画像はプレビューとして使用されます。少なくとも3枚以上の画像を設定することを推奨します。',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: ColorsConstant.gray3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (uploadController.screenshots.isEmpty)
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(uploadAppControllerProvider(appModel)
                                  .notifier)
                              .addScreenShots();
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: AspectRatio(
                            aspectRatio: 345 / 200,
                            child: Assets.images.selectImage.svg(
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    if (uploadController.screenshots.isNotEmpty)
                      ListView.builder(
                        itemBuilder: (context, index) {
                          final imagePath = uploadController.screenshots[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AspectRatio(
                              aspectRatio: 345 / 200,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Utils.isUrl(imagePath)
                                      ? CachedNetworkImage(
                                          imageUrl: imagePath,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                      : Image.file(
                                          File(
                                            imagePath,
                                          ),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                  TextButton(
                                    onPressed: () {
                                      ref
                                          .read(uploadAppControllerProvider(
                                                  appModel)
                                              .notifier)
                                          .removeScreenshot(index);
                                    },
                                    child: Assets.images.delete.svg(),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: uploadController.screenshots.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(
                                uploadAppControllerProvider(appModel).notifier)
                            .addScreenShots();
                      },
                      style: AppStyle.buttonStyleZero(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: ColorsConstant.purple,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '画像を追加する',
                            style: TextStyle(
                              color: ColorsConstant.purple,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  height: 47,
                  child: TextButton(
                    onPressed: () {
                      ref
                          .read(uploadAppControllerProvider(appModel).notifier)
                          .backPage();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          width: 1,
                          color: ColorsConstant.text,
                          style: BorderStyle.solid,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      '戻る',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorsConstant.text,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 47,
                  child: TextButton(
                    onPressed: uploadController.appImageValidate
                        ? () {
                            ref
                                .read(uploadAppControllerProvider(appModel)
                                    .notifier)
                                .nextPage();
                          }
                        : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        uploadController.appImageValidate
                            ? ColorsConstant.text
                            : ColorsConstant.gray2,
                      ),
                    ),
                    child: const Text(
                      '次へ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _avatarImage(String url) {
    if (url.isEmpty) {
      return Assets.images.imageDefault.svg();
    } else {
      if (Utils.isUrl(url)) {
        return CachedNetworkImage(
          imageUrl: url,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        );
      } else {
        return Image.file(
          File(
            url,
          ),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        );
      }
    }
  }
}
