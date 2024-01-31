import 'dart:io';
import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/app_info_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInfo = ref.watch(appInfoProvider(appModel.iosId));
    appInfo.when(
      data: (data) {},
      error: (error, stackTrace) {
        Utils.showAlertError(context: context, error: error);
      },
      loading: () {},
    );

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
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(ColorsConstant.purple),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        '購入する',
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
                  height: 15,
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
