import 'package:ser_manos/models/models.dart';

abstract class VolunteeringData {
  VolunteeringData();

  Future<List<Volunteering>> getAll();

  Future<Volunteering> get(String id);
}
