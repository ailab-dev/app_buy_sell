import 'package:app_buy_sell/base/base_screen.dart';
import 'package:app_buy_sell/screen/home/home_view_model.dart';
import 'package:app_buy_sell/screen/product/product_page.dart';
import 'package:app_buy_sell/utils/navigation.dart';
import 'package:app_buy_sell/utils/theme/color_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseScreen<HomePage, HomeViewModel> {
  @override
  void onViewReady() {
    super.onViewReady();
    viewModel.getApps();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                FirebaseAuth.instance.currentUser?.photoURL ??
                                    ''),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_outlined))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(240, 240, 240, 1),
                    height: 1,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final item = viewModel.appList[index];
                        return InkWell(
                          onTap: () {
                            Navigation.push(
                              context,
                              ProductPage(
                                appModel: item,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Row(
                              children: [
                                Ink(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            item.iconUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        color: ColorsConstant.text,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      item.description,
                                      style: const TextStyle(
                                        color: ColorsConstant.text,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: viewModel.appList.length,
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  ColorsConstant.purple,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
