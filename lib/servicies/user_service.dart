import 'dart:io';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/data/image_data.dart';
import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/models/models.dart';

class UserService {
  final UserData userData;
  final ImageData imageData;

  UserService({required this.userData, required this.imageData});

  Future<User> getUser(UID uid) async {
    return await userData.getUser(uid);
  }

  Future<void> createUser(UID uid, String name, String surname) async {
    return await userData.createUser(uid, name, surname);
  }

  Future<void> updateUser(
    UID uid,
    File? image,
    String? birthday,
    Gender? gender,
    String? phone,
    String? email,
  ) async {
    final String? imageUrl =
        image == null ? null : await imageData.uploadProfileImage(uid, image);

    final update = UserUpdate(
      image: imageUrl,
      birthday: birthday,
      gender: gender,
      phone: phone,
      email: email,
    );

    await userData.updateUser(uid, update);
  }

  Future<void> apply(String uid, String volunteeringId) async {
    User user = (await userData.getUser(uid))!;

    if (user.hasVolunteering()) {
      throw Exception("User already applied to a volunteering.");
    }
    // TODO add vacancies check
    // if (!(await volunteeringService.hasVacancies(volunteeringId))) {
    //   throw Exception("Applied to volunteerings with no vacants.");
    // }

    return userData.apply(uid, volunteeringId);
  }

  Future<void> leaveCurrentVolunteering(String uid) async {
    User? user = (await userData.getUser(uid));

    if (user == null) {
      throw Exception("User not logged in.");
    }

    if (!user.hasVolunteering()) {
      throw Exception("User doesn't have a volunteering.");
    }

    return userData.leaveCurrentVolunteering(uid);
  }
}
