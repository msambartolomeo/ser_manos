import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/data_providers.dart';
import 'package:ser_manos/servicies/auth_service_impl.dart';
import 'package:ser_manos/servicies/interfaces/auth_service.dart';
import 'package:ser_manos/servicies/favorites_service.dart';
import 'package:ser_manos/servicies/logging_service.dart';
import 'package:ser_manos/servicies/user_service.dart';
import 'package:ser_manos/servicies/interfaces/volunteering_service.dart';
import 'package:ser_manos/servicies/volunteering_service_impl.dart';

part 'generated/servicies_providers.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthServiceImplementation(
    authData: ref.read(authDataProvider),
    userService: ref.read(userServiceProvider),
  );
}

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) {
  return UserService(
    userData: ref.read(userDataProvider),
    imageData: ref.read(imageDataProvider),
    loggingService: ref.read(loggingServiceProvider),
  );
}

@Riverpod(keepAlive: true)
FavoritesService favoritesService(FavoritesServiceRef ref) {
  return FavoritesService(favoritesData: ref.read(favoritesDataProvider));
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(VolunteeringServiceRef ref) {
  return VolunteeringServiceImplentation(
    volunteeringData: ref.read(volunteeringDataProvider),
    userService: ref.read(userServiceProvider),
  );
}

@Riverpod(keepAlive: true)
LoggingService loggingService(LoggingServiceRef ref) {
  return LoggingService(firebaseAnalytics: FirebaseAnalytics.instance);
}
