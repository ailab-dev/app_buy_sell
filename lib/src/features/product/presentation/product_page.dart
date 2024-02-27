import 'dart:io';
import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/src/common_widgets/loading_view.dart';
import 'package:app_buy_sell/src/common_widgets/rating_view.dart';
import 'package:app_buy_sell/src/constants/color_constant.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/product/provider/app_state_provider.dart';
import 'package:app_buy_sell/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key, required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider(appModel));
    final didPay = appState.value ?? false;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: LoadingView(
        isLoading: appState.isLoading,
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
                        ? Utils.appStoreUrl(appModel.iosId)
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
                    onPressed: !didPay ? () {} : null,
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
