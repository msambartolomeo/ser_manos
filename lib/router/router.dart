import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/pages/profile/edit_profile.dart';
import 'package:ser_manos/pages/entry.dart';
import 'package:ser_manos/pages/home.dart';
import 'package:ser_manos/pages/login.dart';
import 'package:ser_manos/pages/new_detail.dart';
import 'package:ser_manos/pages/register.dart';
import 'package:ser_manos/pages/volunteering_detail.dart';
import 'package:ser_manos/pages/welcome.dart';

/// The route configuration.
class RouterBuilder {
  final bool loggedIn;

  const RouterBuilder(this.loggedIn);

  GoRouter build() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          builder: (context, state) => const EntryPage(),
          routes: [
            GoRoute(
              path: "login",
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: "register",
              builder: (context, state) => const RegisterPage(),
            ),
          ],
        ),
        GoRoute(
            path: "/home/:tab",
            builder: (context, state) {
              final index = switch (state.pathParameters["tab"]!) {
                "volunterings" => 0,
                "profile" => 1,
                "news" => 2,
                _ => 0,
              };

              return HomePage(index: index);
            },
            routes: [
              GoRoute(
                path: ":param",
                builder: (context, state) {
                  String param = state.pathParameters["param"]!;
                  Widget page;
                  switch (state.pathParameters["tab"]!) {
                    case "volunteerings":
                      page = VolunteeringDetailPage(
                          volunteering: state.extra == null
                              ? null
                              : (state.extra as Map)["volunteering"],
                          id: param);
                      break;
                    case "profile":
                      if (param != "edit") {
                        // TODO: page = errorPage
                      }
                      page = const EditProfileModal();
                      break;
                    case "news":
                      // TODO: pass path param state.pathParameters["id"]!
                      final Map map = state.extra! as Map;
                      page = NewDetailPage(news: map["news"]);
                      break;
                    default:
                      // TODO: page = errorPage
                      final Map map = state.extra! as Map;
                      page = VolunteeringDetailPage(
                          volunteering: map["volunteering"], id: map["id"]);
                  }
                  return page;
                },
              ),
            ]),
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const WelcomePage(),
        ),
      ],
      redirect: (context, state) {
        final location = state.matchedLocation;

        return switch (location) {
          "/" ||
          "/login" ||
          "/register" =>
            loggedIn ? "/home/volunteerings" : null,
          _ => loggedIn ? null : "/",
        };
      },
    );
  }
}
