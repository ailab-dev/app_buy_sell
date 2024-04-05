import 'dart:io';
import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/common_widgets/rating_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/presentation/product_controller.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.appId});

  final String appId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider(appId));
    final appOwnerType =
        productController.value?.appOwnerType ?? AppOwnerType.customer;

    ref.listen(productControllerProvider(appId), (previous, next) {
      next.when(
        data: (result) {
          if (result?.paySuccess == true) {
            context.pop();
            context.push('/purchase-complete');
          }
        },
        error: (Object error, StackTrace stackTrace) {
          if (error is PlatformException) {
            if (error.code == 'paymentCanceled') {
              return;
            }
          }
          Utils.showAlertError(context: context, error: error);
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (appOwnerType == AppOwnerType.onwer)
            MenuAnchor(
              alignmentOffset: const Offset(-80, 0),
              style: const MenuStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
              menuChildren: [
                MenuItemButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Row(
                    children: [
                      Assets.images.editSquare.svg(),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        '編集する',
                        style: TextStyle(
                          color: ColorsConstant.text,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    context.push('/upload-app',
                        extra:
                            ref.read(productControllerProvider(appId)).value);
                  },
                ),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  height: 0,
                  thickness: 0.5,
                ),
                MenuItemButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Row(
                    children: [
                      Assets.images.delete2.svg(),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        '削除する',
                        style: TextStyle(
                          color: ColorsConstant.redStrong,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                )
              ],
              builder: (context, controller, child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                );
              },
            )
        ],
      ),
      body: productController.when(
        data: (data) {
          return LoadingView(
            isLoading: productController.isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    data?.iconUrl ?? ''),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                data?.description ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConstant.dark,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '0.0',
                                    style: TextStyle(
                                      color: ColorsConstant.text,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  RatingView(
                                    rate: 0,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          data?.priceText ?? '',
                          style: const TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          '円',
                          style: TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        final url =
                            Platform.isIOS ? data?.appStoreUrl : data?.gPlayUrl;
                        if (url != null) {
                          launchUrlString(url);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.images.adGroup.svg(),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            Platform.isIOS ? 'App Store' : 'Google Play ストア',
                            style: const TextStyle(color: ColorsConstant.gray3),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed:
                            _clickAppButton(context, data, ref, appOwnerType),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              appOwnerType == AppOwnerType.purchased
                                  ? ColorsConstant.gray
                                  : ColorsConstant.purple),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: _appActionButton(appOwnerType),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final url = data?.banner[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CachedNetworkImage(
                              imageUrl: url ?? '',
                              fit: BoxFit.cover,
                              width: 290,
                            ),
                          );
                        },
                        itemCount: data?.banner.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      '評価とレビュー',
                      style: TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0.0',
                          style: TextStyle(
                            color: ColorsConstant.text,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        RatingView(
                          rate: 0,
                          rateColor: ColorsConstant.purple,
                          unratedColor: ColorsConstant.purpleGray,
                          size: 25,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          Utils.showAlertError(error: error, context: context);
          return null;
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _appActionButton(AppOwnerType appOwnerType) {
    switch (appOwnerType) {
      case AppOwnerType.onwer:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.editSquare.svg(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 18,
              height: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              '編集する',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        );
      case AppOwnerType.purchased:
        return const Text(
          '販売は終了しています',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorsConstant.gray2,
          ),
        );
      case AppOwnerType.customer:
        return const Text(
          '購入する',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        );
    }
  }

  VoidCallback? _clickAppButton(BuildContext context, AppModel? data,
      WidgetRef ref, AppOwnerType appOwnerType) {
    switch (appOwnerType) {
      case AppOwnerType.customer:
        return () {
          showModalBottomSheet(
            useSafeArea: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      leading: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.close)),
                      title: const Text(
                        '購入する',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsConstant.text,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                                child: Center(
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              data?.iconUrl ?? ''),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '購入するアプリ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstant.gray3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data?.name ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstant.text,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: ColorsConstant.gray,
                                      height: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 70,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '支払い金額',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstant.gray3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          data?.priceText ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsConstant.text,
                                          ),
                                        ),
                                        const Text(
                                          '円',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsConstant.text,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      color: ColorsConstant.gray,
                                      height: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                                child: Center(
                                  child: Platform.isIOS
                                      ? Assets.images.applePay.svg(
                                          width: 40,
                                          height: 28,
                                          fit: BoxFit.contain)
                                      : Assets.images.gPay.image(
                                          width: 40,
                                          height: 28,
                                          fit: BoxFit.contain),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '支払い方法',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstant.gray3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      Platform.isIOS
                                          ? 'Apple Pay'
                                          : 'Google Pay',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstant.text,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: ColorsConstant.gray,
                                      height: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 121,
                            child: TextButton(
                              onPressed: () async {
                                context.pop();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      side: const BorderSide(
                                          color: ColorsConstant.text)),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              child: const Text(
                                'キャンセル',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsConstant.text,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 121,
                            child: TextButton(
                              onPressed: () async {
                                ref
                                    .read(productControllerProvider(appId)
                                        .notifier)
                                    .pay();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    ColorsConstant.text),
                              ),
                              child: const Text(
                                '購入する',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        };
      case AppOwnerType.onwer:
        return () {
          context.push('/upload-app',
              extra: ref.read(productControllerProvider(appId)).value);
        };
      case AppOwnerType.purchased:
        return null;
    }
  }
}
