import 'package:app_buy_sell/src/features/home/presentation/home_page.dart';
import 'package:app_buy_sell/src/features/login/presentation/login_page.dart';
import 'package:app_buy_sell/src/features/notification/presentation/notification_page.dart';
import 'package:app_buy_sell/src/features/register/presentation/register_page.dart';
import 'package:app_buy_sell/src/features/register_profile/presentation/register_profile_page.dart';
import 'package:app_buy_sell/src/features/splash/presentation/splash_page.dart';
import 'package:app_buy_sell/src/features/start/start_page.dart';
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
      path: '/notification',
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationPage();
      },
    ),
  ],
);
