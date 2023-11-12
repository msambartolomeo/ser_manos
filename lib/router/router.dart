import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/pages/error.dart';
import 'package:ser_manos/pages/profile/edit_profile.dart';
import 'package:ser_manos/pages/login/entry.dart';
import 'package:ser_manos/pages/home.dart';
import 'package:ser_manos/pages/login/login.dart';
import 'package:ser_manos/pages/new_detail.dart';
import 'package:ser_manos/pages/login/register.dart';
import 'package:ser_manos/pages/volunteering_detail.dart';
import 'package:ser_manos/pages/login/welcome.dart';
import 'package:ser_manos/servicies/logging_service.dart';

/// The route configuration.
class RouterBuilder {
  final bool loggedIn;
  final LoggingService? loggingService;

  const RouterBuilder(this.loggedIn, {this.loggingService});

  GoRouter build() {
    return GoRouter(
      onException: (_, GoRouterState state, GoRouter router) {
        router.go('/404');
      },
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
              int index = switch (state.pathParameters["tab"]!) {
                "volunteerings" => 0,
                "profile" => 1,
                "news" => 2,
                _ => -1,
              };

              if (index == -1) {
                context.go("/404");
                return const ErrorPage(message: "Error");
              }

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
                      Volunteering? volunteering = state.extra == null
                          ? null
                          : (state.extra as Map)["volunteering"];

                      loggingService?.logOpenVolunteering(param);
                      page = VolunteeringDetailPage(
                          volunteering: volunteering, id: param);
                      break;
                    case "profile":
                      if (param != "edit") {
                        context.go("/404");
                      }
                      page = const EditProfileModal();
                      break;
                    case "news":
                      loggingService?.logOpenNews(param);
                      final Map map = state.extra! as Map;
                      page = NewDetailPage(news: map["news"], id: param);
                      break;
                    default:
                      context.go("/404");
                      page = const ErrorPage(message: "Error");
                  }
                  return page;
                },
              ),
            ]),
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          path: "/404",
          builder: (context, state) {
            return ErrorPage(
              message: state.extra as String? ?? "La página no fue encontrada",
            );
          },
        )
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
