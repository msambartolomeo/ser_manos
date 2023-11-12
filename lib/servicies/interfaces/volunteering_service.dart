import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

abstract class VolunteeringService {
  VolunteeringService();

  Future<List<Volunteering>> getAll(GeoPoint? geolocation);

  Future<Volunteering> get(String id);

  Future<bool> hasVacancies(String id);

  Future<void> apply(String uid, String volunteeringId);

  Future<void> dropout(String uid);

  void listenToVacantChanges();

  Stream<Map<String, int>> getVacantStream();

  // void listenToSpecificVacantChanges(String id);
}
