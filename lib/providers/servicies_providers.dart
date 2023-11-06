import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/data_providers.dart';
import 'package:ser_manos/servicies/auth_service.dart';
import 'package:ser_manos/servicies/user_service.dart';
import 'package:ser_manos/servicies/volunteering_service.dart';

part 'generated/servicies_providers.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    authData: ref.read(authDataProvider),
    userService: ref.read(userServiceProvider),
  );
}

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) {
  return UserService(
    userData: ref.read(userDataProvider),
    imageData: ref.read(imageDataProvider),
  );
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(VolunteeringServiceRef ref) {
  return VolunteeringService(
      volunteeringData: ref.read(volunteeringDataProvider));
}
