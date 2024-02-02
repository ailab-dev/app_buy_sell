import 'dart:io';
import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/provider/app_info_provider.dart';
import 'package:app_buy_sell/src/features/product/provider/app_state_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInfo = ref.watch(appInfoProvider(appModel.iosId));
    final appState = ref.watch(appStateProvider(appModel));
    final didPay = appState.value ?? false;

    ref.listen(appInfoProvider(appModel.iosId), (previous, next) {
      next.when(
        data: (data) {},
        error: (Object error, StackTrace stackTrace) {
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
        isLoading: appInfo.isLoading,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                appInfo.value?.rateString ?? '',
                                style: const TextStyle(
                                  color: ColorsConstant.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              RatingBarIndicator(
                                rating: appInfo.value?.rate ?? 0,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(76, 92, 123, 1),
                                ),
                                unratedColor: ColorsConstant.purpleGray,
                                itemCount: 5,
                                itemSize: 14,
                              )
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
                        ? Utils.appstoreUrl(appModel.iosId)
                        : Utils.googlePlayUrl(appModel.androidId);
                    launchUrlString(url);
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
                                                onPressed: () async {},
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      appInfo.value?.rateString ?? '',
                      style: const TextStyle(
                        color: ColorsConstant.text,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RatingBarIndicator(
                      rating: appInfo.value?.rate ?? 0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: ColorsConstant.purple,
                      ),
                      unratedColor: ColorsConstant.purpleGray,
                      itemCount: 5,
                      itemSize: 25,
                    )
                  ],
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    final item = appInfo.value?.reviewList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorsConstant.gray,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              4,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: double.parse(
                                        item?.rating?.label ?? '0'),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: ColorsConstant.purple,
                                    ),
                                    unratedColor: ColorsConstant.purpleGray,
                                    itemCount: 5,
                                    itemSize: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          item?.dateText ?? '',
                                          style: const TextStyle(
                                            color: ColorsConstant.gray3,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            item?.author?.name?.label ?? '',
                                            style: const TextStyle(
                                              color: ColorsConstant.gray3,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                item?.title?.label ?? '',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsConstant.text,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ReadMoreText(
                                item?.content?.label ?? '',
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'もっと見る',
                                trimExpandedText: '',
                                moreStyle: const TextStyle(
                                  color: Color.fromRGBO(123, 106, 224, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConstant.dark,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: appInfo.value?.reviewList.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
