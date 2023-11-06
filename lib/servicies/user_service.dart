import 'package:ser_manos/data/user_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/volunteering_service.dart';

class UserService {
  final UserData userData;
  final VolunteeringService volunteeringService;

  UserService({required this.userData, required this.volunteeringService});

  Future<User> getUser(String uid) async {
    User? user = await userData.getUser(uid);

    if (user == null) {
      throw Exception("User does not exist.");
    }

    return user;
  }

  Future<void> apply(String uid, String volunteeringId) async {
    User user = (await userData.getUser(uid))!;

    if (user.hasVolunteering()) {
      throw Exception("User already applied to a volunteering.");
    }
    if (!(await volunteeringService.hasVacancies(volunteeringId))) {
      throw Exception("Applied to volunteerings with no vacants.");
    }

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
