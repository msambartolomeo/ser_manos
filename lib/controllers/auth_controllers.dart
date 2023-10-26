import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/router_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/auth_service.dart';

part 'generated/auth_controllers.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    final AuthService authService = ref.read(authServiceProvider);
    final GoRouter router = ref.read(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authService.login(email, password);

      router.go("/welcome");
    });
  }
}

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<void> build() {}

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    final AuthService authService = ref.read(authServiceProvider);
    final GoRouter router = ref.read(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authService.register(name, surname, email, password);
      router.go("/welcome");
    });
  }
}

@riverpod
class LogOutController extends _$LogOutController {
  @override
  FutureOr<void> build() {}

  Future<void> logOut() async {
    final AuthService authService = ref.read(authServiceProvider);
    final GoRouter router = ref.read(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authService.logOut();
      router.go("/");
    });
  }
}
