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
  const ProductPage({super.key, required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider(appModel));
    final didPay = productController.value?.didPay ?? false;

    ref.listen(ProductControllerProvider(appModel), (previous, next) {
      next.when(
        data: (result) {
          if (result.paySuccess == true) {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: LoadingView(
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
                            image: CachedNetworkImageProvider(appModel.iconUrl),
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
                            appModel.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            appModel.description,
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
                      appModel.priceText,
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
                    final url = Platform.isIOS
                        ? appModel.appStoreUrl
                        : appModel.gPlayUrl;
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
                    onPressed: !didPay
                        ? () {
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
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                CachedNetworkImageProvider(
                                                                    appModel
                                                                        .iconUrl),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        '購入するアプリ',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsConstant
                                                              .gray3,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        appModel.name,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsConstant
                                                              .text,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        color:
                                                            ColorsConstant.gray,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        '支払い金額',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsConstant
                                                              .gray3,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            appModel.priceText,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorsConstant
                                                                      .text,
                                                            ),
                                                          ),
                                                          const Text(
                                                            '円',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorsConstant
                                                                      .text,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        color:
                                                            ColorsConstant.gray,
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
                                                        ? Assets.images.applePay
                                                            .svg(
                                                                width: 40,
                                                                height: 28,
                                                                fit: BoxFit
                                                                    .contain)
                                                        : Assets.images.gPay
                                                            .image(
                                                                width: 40,
                                                                height: 28,
                                                                fit: BoxFit
                                                                    .contain),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        '支払い方法',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsConstant
                                                              .gray3,
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
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsConstant
                                                              .text,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        color:
                                                            ColorsConstant.gray,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 15, 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 121,
                                              child: TextButton(
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        side: const BorderSide(
                                                            color:
                                                                ColorsConstant
                                                                    .text)),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
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
                                                      .read(
                                                          productControllerProvider(
                                                                  appModel)
                                                              .notifier)
                                                      .pay(appModel);
                                                },
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
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
                          }
                        : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(!didPay
                          ? ColorsConstant.purple
                          : ColorsConstant.gray),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        !didPay ? '購入する' : '買った',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: !didPay ? Colors.white : ColorsConstant.gray2,
                        ),
                      ),
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
                      final url = appModel.banner[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          width: 290,
                        ),
                      );
                    },
                    itemCount: appModel.banner.length,
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
      ),
    );
  }
}
