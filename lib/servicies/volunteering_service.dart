import 'package:ser_manos/data/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringService {
  final VolunteeringData volunteeringData;

  VolunteeringService({required this.volunteeringData});

  Future<Map<String, Volunteering>> getAll() async {
    return await volunteeringData.getAll();
  }

  Future<Volunteering> get(String id) async {
    return await volunteeringData.get(id);
  }

  Future<bool> hasVacancies(String id) async {
    Volunteering volunteering = await get(id);
    return volunteering.vacants > 0;
  }

  void listenToVacantChanges() {
    volunteeringData.listenToVacantChanges();
  }

  Stream<Map<String, int>> getVacantStream() {
    return volunteeringData.getVacantStream();
  }

  void listenToSpecificVacantChanges(String id) {
    volunteeringData.listenToSpecificVacantChanges(id);
  }

}
