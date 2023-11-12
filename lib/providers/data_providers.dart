import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/auth_data_impl.dart';
import 'package:ser_manos/data/image_data_impl.dart';
import 'package:ser_manos/data/interfaces/auth_data.dart';
import 'package:ser_manos/data/interfaces/image_data.dart';
import 'package:ser_manos/data/interfaces/news_data.dart';
import 'package:ser_manos/data/interfaces/user_data.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/data/news_data_impl.dart';
import 'package:ser_manos/data/user_data_impl.dart';
import 'package:ser_manos/data/volunteering_data_impl.dart';
import 'package:ser_manos/providers/firebase_providers.dart';

part 'generated/data_providers.g.dart';

@Riverpod(keepAlive: true)
AuthData authData(AuthDataRef ref) {
  return AuthDataImplementation(
    firebaseAuth: ref.read(firebaseAuthProvider),
  );
}

@Riverpod(keepAlive: true)
UserData userData(UserDataRef ref) {
  return UserDataImplementation(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
ImageData imageData(ImageDataRef ref) {
  return ImageDataImplementation(
    firebaseStorage: ref.read(firebaseStorageProvider),
  );
}

@Riverpod(keepAlive: true)
VolunteeringData volunteeringData(VolunteeringDataRef ref) {
  return VolunteeringDataImplementation(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
NewsData newsData(NewsDataRef ref) {
  return NewsDataImplementation(
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
  );
}
