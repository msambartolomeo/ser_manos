import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/volunteering_data.dart';
import 'package:ser_manos/models/models.dart';

class VolunteeringService {
  final VolunteeringData volunteeringData;

  VolunteeringService({
    required this.volunteeringData,
  });

  Future<List<Volunteering>> getAll(GeoPoint? geolocation) async {
    final volunteerings = await volunteeringData.getAll();

    final comparator = getCompareFunction(geolocation);

    volunteerings.sort(comparator);

    return volunteerings;
  }

  Future<Volunteering> get(String id) async {
    return await volunteeringData.get(id);
  }

  Future<bool> hasVacancies(String id) async {
    Volunteering volunteering = await get(id);
    return volunteering.vacants > 0;
  }
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
