import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/user_service.dart';

part 'generated/current_user_provider.g.dart';

typedef AuthUser = auth.User;

@riverpod
Stream<AuthUser?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

@riverpod
class CurrentAuthUser extends _$CurrentAuthUser {
  @override
  AuthUser? build() {
    final loginState = ref.watch(authStateChangeProvider);

    print(loginState);

    return loginState.maybeWhen(
      data: (user) => user,
      orElse: () => null,
    );
  }
}

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  FutureOr<User?> build() async {
    final UserService userService = ref.watch(userServiceProvider);
    final AuthUser? user = ref.read(currentAuthUserProvider);

    if (user == null) {
      return Future.value(null);
    }

    return await userService.getUser(user.uid);
  }
}
