import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/models/models.dart';

class UserService {
  final UserData userData;

  UserService({required this.userData});

  Future<User> getUser(String uid) {
    return userData.getUser(uid);
  }
}
