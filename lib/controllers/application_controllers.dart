import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/application_controllers.g.dart';

@riverpod
class ApplicationController extends _$ApplicationController {
  // User? profile;

  @override
  FutureOr<Application?> build() async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(userServiceProvider);

    User user = await service.getUser(uid);

    return user.application;
  }

  Future<void> dropout() async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(volunteeringServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.dropout(uid);
      return null;
    });
  }

  Future<void> apply(String volunteeringId) async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(volunteeringServiceProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await service.apply(uid, volunteeringId);
      return Application(volunteering: volunteeringId, approved: false);
    });
  }

  UID? _getUserId() {
    final user = ref.read(currentAuthUserProvider);

    return user?.uid;
  }
}
