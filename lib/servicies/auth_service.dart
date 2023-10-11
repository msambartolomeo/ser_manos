import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/auth_data.dart';

part 'generated/auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    final authData = ref.read(authDataProvider.notifier);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authData.login(email, password);
    });
  }

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    final AuthData authData = ref.watch(authDataProvider.notifier);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authData.register(email, password);
    });
  }
}
