import 'package:app_buy_sell/base/base_screen.dart';
import 'package:app_buy_sell/gen/assets.gen.dart';
import 'package:app_buy_sell/model/app_model.dart';
import 'package:app_buy_sell/screen/product/product_view_model.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.appModel,
  });

  final AppModel appModel;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BaseScreen<ProductPage, ProductViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ProductViewModel>(builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
          ),
          body: SingleChildScrollView(
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
                                  widget.appModel.iconUrl),
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
                              widget.appModel.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.appModel.description,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '2.5',
                                  style: TextStyle(
                                    color: ColorsConstant.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                RatingBarIndicator(
                                  rating: 2.5,
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
                  const Row(
                    children: [
                      Spacer(),
                      Text(
                        '300,000',
                        style: TextStyle(
                          color: ColorsConstant.text,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
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
                  Row(
                    children: [
                      Assets.images.adGroup.svg(),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'App Store',
                        style: TextStyle(color: ColorsConstant.gray3),
                      )
                    ],
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
                      const Text(
                        '2.5',
                        style: TextStyle(
                          color: ColorsConstant.text,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      RatingBarIndicator(
                        rating: 2.5,
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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: ColorsConstant.gray,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 2.5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: ColorsConstant.purple,
                                    ),
                                    unratedColor: ColorsConstant.purpleGray,
                                    itemCount: 5,
                                    itemSize: 25,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
