import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/current_user_provider.g.dart';

typedef AuthUser = User;

@riverpod
Stream<User?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  AuthUser? build() {
    final loginState = ref.watch(authStateChangeProvider);

    return loginState.maybeWhen(
      data: (user) => user,
      orElse: () => null,
    );
  }
}
