import 'dart:io';

import 'package:ser_manos/data/auth_data_impl.dart';
import 'package:ser_manos/models/models.dart';

abstract class UserService {
  UserService();

  Future<User> getUser(UID uid);

  Future<void> createUser(UID uid, String name, String surname);

  Future<void> updateUser(
    UID uid,
    File? image,
    String? birthday,
    Gender? gender,
    String? phone,
    String? email,
  );

  Future<void> setApplication(UID uid, String volunteeringId);

  Future<void> deleteApplication(UID uid);

  Future<List<String>> getFavorites(String uid);

  Future<void> addFavorite(String uid, String volunteering);

  Future<void> removeFavorite(String uid, String volunteering);
}
