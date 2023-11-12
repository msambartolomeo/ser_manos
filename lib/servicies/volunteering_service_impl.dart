import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/interfaces/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';
import 'package:ser_manos/servicies/interfaces/volunteering_service.dart';
import 'package:ser_manos/servicies/logging_service.dart';

class VolunteeringServiceImplentation implements VolunteeringService {
  final VolunteeringData volunteeringData;
  final UserService userService;
  final LoggingService? loggingService;

  VolunteeringServiceImplentation({
    required this.volunteeringData,
    this.loggingService,
    required this.userService,
  });

  @override
  Future<List<Volunteering>> getAll(GeoPoint? geolocation) async {
    final volunteerings = await volunteeringData.getAll();

    final comparator = getCompareFunction(geolocation);

    volunteerings.sort(comparator);

    return volunteerings;
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

    await volunteeringData.decreaseVacants(volunteeringId);

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

    await volunteeringData.increaseVacants(user.getAppliedVolunteeringId());

    return;
  }

  @override
  void listenToVacantChanges() {
    volunteeringData.listenToVacantChanges();
  }

  @override
  Stream<Map<String, int>> getVacantStream() {
    return volunteeringData.getVacantStream();
  }

  // @override
  // void listenToSpecificVacantChanges(String id) {
  //   volunteeringData.listenToSpecificVacantChanges(id);
  // }
}

int Function(Volunteering, Volunteering) getCompareFunction(
  GeoPoint? geolocation,
) {
  if (geolocation == null) {
    return (v1, v2) => v2.compareCreationDate(v1);
  } else {
    return (v1, v2) {
      int distance =
          v1.distanceTo(geolocation).compareTo(v2.distanceTo(geolocation));
      if (distance == 0) {
        return v2.compareCreationDate(v1);
      }
      return distance;
    };
  }
}
