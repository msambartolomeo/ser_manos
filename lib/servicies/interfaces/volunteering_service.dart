import 'package:ser_manos/models/models.dart';

abstract class VolunteeringService {
  VolunteeringService();

  Future<Map<String, Volunteering>> getAll();

  Future<Volunteering> get(String id);

  Future<bool> hasVacancies(String id);

  Future<void> apply(String uid, String volunteeringId);

  Future<void> dropout(String uid);
}
