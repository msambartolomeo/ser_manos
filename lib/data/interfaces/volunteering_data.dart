import 'package:ser_manos/models/models.dart';

abstract class VolunteeringData {
  VolunteeringData();

  Future<List<Volunteering>> getAll();

  Future<Volunteering> get(String id);

  void listenToVacantChanges();

  Stream<Map<String, int>> getVacantStream();

  Future<void> decreaseVacants(String volunteeringId);

  Future<void> increaseVacants(String volunteeringId);

  // void listenToSpecificVacantChanges(String id);
}
