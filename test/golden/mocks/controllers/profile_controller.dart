import 'package:ser_manos/controllers/profile_controllers.dart';
import 'package:ser_manos/models/models.dart';

import '../models/user_mock.dart';

class CompleteProfileControllerMock extends ProfileController {
  @override
  Future<User> build() async {
    return completeUserMock;
  }
}

class IncompleteProfileControllerMock extends ProfileController {
  @override
  Future<User> build() async {
    return incompleteUserMock;
  }
}
