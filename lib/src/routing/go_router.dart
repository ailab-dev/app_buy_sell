import 'package:app_buy_sell/src/features/edit_profile/presentation/edit_profile_page.dart';
import 'package:app_buy_sell/src/features/home/domain/app_model.dart';
import 'package:app_buy_sell/src/features/home/presentation/home_page.dart';
import 'package:app_buy_sell/src/features/login/presentation/login_page.dart';
import 'package:app_buy_sell/src/features/notification/presentation/notification_page.dart';
import 'package:app_buy_sell/src/features/product/presentation/product_page.dart';
import 'package:app_buy_sell/src/features/product/presentation/purchase_complete_page.dart';
import 'package:app_buy_sell/src/features/register/presentation/register_page.dart';
import 'package:app_buy_sell/src/features/register_profile/presentation/register_profile_page.dart';
import 'package:app_buy_sell/src/features/setting/presentation/setting_page.dart';
import 'package:app_buy_sell/src/features/splash/presentation/splash_page.dart';
import 'package:app_buy_sell/src/features/start/start_page.dart';
import 'package:app_buy_sell/src/features/upload_app/upload_app_page.dart';
import 'package:app_buy_sell/src/features/user_profile/presentation/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/start',
      builder: (BuildContext context, GoRouterState state) {
        return const StartPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/registerProfile',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterProfilePage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/purchase-complete',
      builder: (BuildContext context, GoRouterState state) {
        return const PurchaseCompletePage();
      },
    ),
    GoRoute(
        path: '/upload-app',
        builder: (BuildContext context, GoRouterState state) {
          return const UploadAppPage();
        }),
    GoRoute(
      path: '/notification',
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationPage();
      },
    ),
    GoRoute(
      path: '/purchase-complete',
      builder: (BuildContext context, GoRouterState state) {
        return const PurchaseCompletePage();
      },
    ),
    GoRoute(
      path: '/product',
      builder: (BuildContext context, GoRouterState state) {
        final appModel = state.extra as AppModel;
        return ProductPage(
          appModel: appModel,
        );
      },
    ),
    GoRoute(
      path: '/user-profile',
      builder: (BuildContext context, GoRouterState state) {
        return UserProfilePage(
          userId: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (BuildContext context, GoRouterState state) {
        return const EditProfilePage();
      },
    ),
    GoRoute(
      path: '/setting',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingPage();
      },
    ),
  ],
);
