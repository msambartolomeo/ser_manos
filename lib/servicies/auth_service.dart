import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/providers/router_provider.dart';

part 'generated/auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    final authData = ref.watch(authDataProvider.notifier);
    final router = ref.watch(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authData.login(email, password);
      router.go("/welcome");
    });
  }

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    final AuthData authData = ref.watch(authDataProvider.notifier);
    final router = ref.watch(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authData.register(email, password);
      router.go("/welcome");
    });
  }
}

@riverpod
User? loggedInUser(LoggedInUserRef ref) {
  final loginState = ref.watch(authStateChangeProvider);

  return loginState.when(
    data: (user) {
      return user;
    },
    error: (e, s) => null,
    loading: () => null,
  );
}

enum LoginState { unauthenthicated, loggedIn, loading }
