import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';

part 'generated/profile_controllers.g.dart';

@riverpod
class UpdateUserController extends _$UpdateUserController {
  @override
  FutureOr<void> build() {}

  Future<void> updateUser(
    String uid,
    XFile? image,
    String? birthday,
    Gender? gender,
    String? phone,
    String? email,
  ) async {
    final UserService userService = ref.read(userServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await userService.updateUser(uid, image, birthday, gender, phone, email);

      // NOTE: force search of updated user
      ref.invalidate(profileControllerProvider);
    });
  }
}

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

  UID? _getUserId() {
    final user = ref.read(currentAuthUserProvider);

    return user?.uid;
  }
}
