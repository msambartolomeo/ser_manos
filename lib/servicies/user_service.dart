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
}
