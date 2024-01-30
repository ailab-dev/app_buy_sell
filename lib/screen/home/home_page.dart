import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
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
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  FirebaseAuth.instance.currentUser?.photoURL ??
                                      '')),
                        )
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
