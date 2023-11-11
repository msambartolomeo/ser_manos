import 'dart:io';
import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/data/image_data.dart';
import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';
import 'package:ser_manos/servicies/logging_service.dart';

class UserServiceImplementation implements UserService {
  final UserData userData;
  final ImageData imageData;
  final LoggingService? loggingService;

  UserServiceImplementation(
      {required this.userData, required this.imageData, this.loggingService});

  @override
  Future<User> getUser(UID uid) async {
    return await userData.getUser(uid);
  }

  @override
  Future<void> createUser(UID uid, String name, String surname) async {
    loggingService?.logCreateUser(uid);
    return await userData.createUser(uid, name, surname);
  }

  @override
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

  @override
  Future<void> setApplication(String uid, String volunteeringId) {
    return userData.setApplication(uid, volunteeringId);
  }

  @override
  Future<void> deleteApplication(String uid) {
    return userData.deleteApplication(uid);
  }

  @override
  Future<List<String>> getFavorites(String uid) {
    return userData.getFavorites(uid);
  }

  @override
  Future<void> addFavorite(String uid, String volunteering) {
    return userData.addFavorite(uid, volunteering);
  }

  @override
  Future<void> removeFavorite(String uid, String volunteering) {
    return userData.removeFavorite(uid, volunteering);
  }
}
