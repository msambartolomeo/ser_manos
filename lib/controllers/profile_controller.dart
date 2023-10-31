import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<User> build() async {
    final AuthUser? user = ref.read(currentAuthUserProvider);

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(userServiceProvider);

    return await service.getUser(user.uid);
  }

  FutureOr<void> create(User profile) {}

  FutureOr<void> updateProfile(User profile) {}

  FutureOr<void> updateVolunteering(String volunteeringId) {}

  FutureOr<void> addFavorite(String volunteeringId) {}

  FutureOr<void> removeFavorite(String volunteeringId) {}
}
