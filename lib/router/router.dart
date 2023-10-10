import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/main.dart';
import 'package:ser_manos/pages/entry.dart';
import 'package:ser_manos/pages/login.dart';
import 'package:ser_manos/pages/register.dart';
import 'package:ser_manos/pages/welcome.dart';

/// The route configuration.
final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const EntryPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "title");
          },
        ),
        GoRoute(
          path: 'welcome',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomePage();
          },
        ),
      ],
    ),
  ],
);
