import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Profile> build() async {
    final User? user = _getUser();

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(profileServiceProvider);

    return await service.getProfile(user.uid);
  }

  FutureOr<void> create(Profile profile) {}

  FutureOr<void> updateProfile(Profile profile) {}

  FutureOr<void> leaveCurrentVolunteering() async {
    final User? user = _getUser();

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(profileServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.leaveCurrentVolunteering(user.uid);
      return await service.getProfile(user.uid);
    });
  }

  FutureOr<void> apply(String volunteeringId) async {
    final User? user = _getUser();

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(profileServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.apply(user.uid, volunteeringId);
      return await service.getProfile(user.uid);
    });
  }

  User? _getUser() {
    return ref.read(currentUserProvider);
  }
}
