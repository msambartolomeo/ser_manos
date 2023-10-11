import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/auth_data.g.dart';

@riverpod
class AuthData extends _$AuthData {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    final firebaseAuth = ref.watch(firebaseAuthProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> register(String email, String password) async {
    final firebaseAuth = ref.watch(firebaseAuthProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }
}

@riverpod
Stream<User?> authStateChange(AuthStateChangeRef ref) async* {
  ref.watch(firebaseAuthProvider).authStateChanges();
}
