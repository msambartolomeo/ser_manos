import 'package:go_router/go_router.dart';
import 'package:ser_manos/pages/edit_profile.dart';
import 'package:ser_manos/pages/entry.dart';
import 'package:ser_manos/pages/home.dart';
import 'package:ser_manos/pages/login.dart';
import 'package:ser_manos/pages/new_detail.dart';
import 'package:ser_manos/pages/register.dart';
import 'package:ser_manos/pages/volunteering_detail.dart';
import 'package:ser_manos/pages/welcome.dart';

/// The route configuration.
class RouterBuilder {
  final bool authState;

  const RouterBuilder(this.authState);

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
        ),
        GoRoute(
          path: "/home/volunteerings/:id",
          builder: (context, state) =>
              // TODO: pass path param state.pathParameters["id"]!
              const VolunteeringDetailPage(),
        ),
        GoRoute(
          path: '/home/profile/edit',
          builder: (context, state) => const EditProfileModal(),
        ),
        GoRoute(
          path: "/home/news/:id",
          builder: (context, GoRouterState state) =>
              // TODO: pass path param state.pathParameters["id"]!
              const NewDetailPage(),
        ),
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const WelcomePage(),
        ),
      ],
    );
  }
}
