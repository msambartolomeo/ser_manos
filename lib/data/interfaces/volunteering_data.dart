import 'package:ser_manos/models/models.dart';

abstract class VolunteeringData {
  VolunteeringData();

  Future<Map<String, Volunteering>> getAll();

  Future<Volunteering> get(String id);
}
