import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/data/favorites_data.dart';
import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/data/volunteering_data.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/data_providers.g.dart';

@Riverpod(keepAlive: true)
AuthData authData(AuthDataRef ref) {
  return AuthData(
    firebaseAuth: ref.read(firebaseAuthProvider),
  );
}

@Riverpod(keepAlive: true)
UserData userData(UserDataRef ref) {
  return UserData(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
FavoritesData favoritesData(FavoritesDataRef ref) {
  return FavoritesData(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
VolunteeringData volunteeringData(VolunteeringDataRef ref) {
  return VolunteeringData(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}
