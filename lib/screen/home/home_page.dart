import 'package:app_buy_sell/base/base_screen.dart';
import 'package:app_buy_sell/screen/home/home_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseScreen<HomePage, HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                FirebaseAuth.instance.currentUser?.photoURL ??
                                    ''))
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(240, 240, 240, 1),
                    height: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
