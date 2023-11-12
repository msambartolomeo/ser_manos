import 'package:ser_manos/models/models.dart';

abstract class UserData {
  UserData();

  Future<User> getUser(String uid);

  Future<void> setApplication(String uid, String volunteeringId);

  Future<void> deleteApplication(String uid);

  Future<void> createUser(String uid, String name, String surname);

  Future<void> updateUser(String uid, UserUpdate user);

  Future<List<String>> getFavorites(String uid);

  Future<void> addFavorite(String uid, String volunteering);

  Future<void> removeFavorite(String uid, String volunteering);
}
