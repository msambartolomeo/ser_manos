import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/router_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/user_service.dart';

part 'generated/profile_controllers.g.dart';

@riverpod
class UpdateUserController extends _$UpdateUserController {
  @override
  FutureOr<void> build() {}

  Future<void> updateUser(
    String uid,
    File? image,
    String? birthday,
    Gender? gender,
    String? phone,
    String? email,
  ) async {
    final UserService userService = ref.read(userServiceProvider);
    final GoRouter router = ref.read(routerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await userService.updateUser(uid, image, birthday, gender, phone, email);

      // NOTE: force search of updated user
      ref.invalidate(userServiceProvider);

      router.go("/home/profile");
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

  Future<void> leaveCurrentVolunteering() async {
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

  Future<void> apply(String volunteeringId) async {
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
