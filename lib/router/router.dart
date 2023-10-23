import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/pages/edit_profile.dart';
import 'package:ser_manos/pages/entry.dart';
import 'package:ser_manos/pages/home.dart';
import 'package:ser_manos/pages/login.dart';
import 'package:ser_manos/pages/new_detail.dart';
import 'package:ser_manos/pages/register.dart';
import 'package:ser_manos/pages/volunteering_detail.dart';
import 'package:ser_manos/pages/welcome.dart';

final rootNavigator = GlobalKey<NavigatorState>();

/// The route configuration.
class RouterBuilder {
  final bool authState;

  const RouterBuilder(this.authState);

  GoRouter build() {
    return GoRouter(
      navigatorKey: rootNavigator,
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
          path: "/home",
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: "volunteerings",
              builder: (context, state) => const HomePage(index: 0),
              routes: [
                GoRoute(
                  path: ":id",
                  builder: (context, state) =>
                      // TODO: pass path param state.pathParameters["id"]!
                      const VolunteeringDetailPage(),
                ),
              ],
            ),
            GoRoute(
              path: "profile",
              builder: (context, state) => const HomePage(index: 1),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (context, state) => const EditProfileModal(),
                ),
              ],
            ),
            GoRoute(
              path: "news",
              builder: (context, state) => const HomePage(index: 2),
              routes: [
                GoRoute(
                  path: ":id",
                  builder: (context, GoRouterState state) =>
                      // TODO: pass path param state.pathParameters["id"]!
                      const NewDetailPage(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const WelcomePage(),
        ),
      ],
    );
  }
}
