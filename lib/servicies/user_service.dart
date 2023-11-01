import 'dart:io';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/models/models.dart';

class UserService {
  final UserData userData;

  UserService({required this.userData});

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
    final update = UserUpdate(
      // image: image, TODO: add image to firebase
      birthday: birthday,
      gender: gender,
      phone: phone,
      email: email,
    );

    await userData.updateUser(uid, update);
  }
}
