import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/main.dart';
import 'package:ser_manos/pages/welcome.dart';

/// The route configuration.
final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "title");
          },
        ),
      ],
    ),
  ],
);
