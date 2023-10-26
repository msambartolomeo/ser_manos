import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/data_providers.dart';
import 'package:ser_manos/servicies/auth_service.dart';
import 'package:ser_manos/servicies/profile_service.dart';

part 'generated/servicies_providers.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    authData: ref.read(authDataProvider),
  );
}

@Riverpod(keepAlive: true)
ProfileService profileService(ProfileServiceRef ref){
  return ProfileService(
    profileData: ref.read(profileDataProvider)
  );
}

