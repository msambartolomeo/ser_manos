import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/profile_controller.g.dart';

typedef UID = String;

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<User> build() async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(userServiceProvider);

    return await service.getUser(uid);
  }

  FutureOr<void> create(User profile) {}

  FutureOr<void> updateProfile(User profile) {}

  FutureOr<void> leaveCurrentVolunteering() async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(userServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.leaveCurrentVolunteering(uid);
      return await service.getUser(uid);
    });
  }

  FutureOr<void> apply(String volunteeringId) async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(userServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.apply(uid, volunteeringId);
      return await service.getUser(uid);
    });
  }

  UID? _getUserId() {
    final user = ref.read(currentAuthUserProvider);

    return user?.uid;
  }
}
