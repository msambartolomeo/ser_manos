import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/data_providers.g.dart';

@Riverpod(keepAlive: true)
AuthData authData(AuthDataRef ref) {
  return AuthData(
    firebaseAuth: ref.read(firebaseAuthProvider),
  );
}
