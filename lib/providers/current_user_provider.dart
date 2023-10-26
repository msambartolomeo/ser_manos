import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/current_user_provider.g.dart';

// @riverpod
// Stream<User?> authStateChange(AuthStateChangeRef ref) async* {
//   ref.watch(firebaseAuthProvider).authStateChanges();
// }

// @riverpod
// class CurrentUser extends _$CurrentUser {
//   @override
//   User? build() {
//     final loginState = ref.watch(authStateChangeProvider);

//     return loginState.maybeWhen(
//       data: (user) {
//         // TODO: get full user from firebase
//         return user;
//       },
//       orElse: () => null,
//     );
//   }
// }

@riverpod
User? currentUser(CurrentUserRef ref) {
  return ref.watch(firebaseAuthProvider).currentUser;
}
