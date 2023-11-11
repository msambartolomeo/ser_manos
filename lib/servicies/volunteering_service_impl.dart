import 'package:ser_manos/data/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';
import 'package:ser_manos/servicies/interfaces/volunteering_service.dart';
import 'package:ser_manos/servicies/logging_service.dart';

class VolunteeringServiceImplentation implements VolunteeringService {
  final VolunteeringData volunteeringData;
  final UserService userService;
  final LoggingService? loggingService;

  VolunteeringServiceImplentation(
      {required this.volunteeringData,
      this.loggingService,
      required this.userService});

  @override
  Future<Map<String, Volunteering>> getAll() async {
    return await volunteeringData.getAll();
  }

  @override
  Future<Volunteering> get(String id) async {
    return await volunteeringData.get(id);
  }

  @override
  Future<bool> hasVacancies(String id) async {
    Volunteering volunteering = await get(id);
    return volunteering.vacants > 0;
  }

  @override
  Future<void> apply(String uid, String volunteeringId) async {
    User user = await userService.getUser(uid);

    if (user.hasVolunteering()) {
      throw Exception("User already applied to a volunteering.");
    }

    loggingService?.logApply(volunteeringId);

    await userService.setApplication(uid, volunteeringId);

    // TODO Handle volunteering collection changes

    return;
  }

  @override
  Future<void> dropout(String uid) async {
    User user = await userService.getUser(uid);

    if (!user.hasVolunteering()) {
      throw Exception("User doesn't have a volunteering.");
    }

    loggingService?.logDropout(user.getAppliedVolunteeringId());

    await userService.deleteApplication(uid);

    // TODO Handle volunteering collection changes

    return;
  }
}
