import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/volunteering_controllers.g.dart';

@riverpod
Future<List<Volunteering>> volunteeringGetAllController(
  VolunteeringGetAllControllerRef ref,
  GeoPoint? geolocation,
) async {
  return await ref.read(volunteeringServiceProvider).getAll(geolocation);
}

@riverpod
Future<Volunteering> volunteeringGetByIdController(
  VolunteeringGetByIdControllerRef ref,
  String id,
) async {
  return await ref.read(volunteeringServiceProvider).get(id);
}

final volunteeringStreamProvider = StreamProvider<Map<String, int>>((ref) {
  final serviceProvider = ref.read(volunteeringServiceProvider);
  serviceProvider.listenToVacantChanges();

  return serviceProvider.getVacantStream();
});


// final specificVolunteeringStreamProvider =
// StreamProvider.autoDispose.family<Map<String, int>, String>(
//       (ref, id) {
//     final serviceProvider = ref.read(volunteeringServiceProvider);
//     serviceProvider.listenToSpecificVacantChanges(id);

//     return serviceProvider.getVacantStream();
//   },
// );
