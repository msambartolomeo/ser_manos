import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/volunteering_controllers.g.dart';

@riverpod
Future<Map<String, Volunteering>> volunteeringGetAllController(
    VolunteeringGetAllControllerRef ref) {
  return ref.read(volunteeringServiceProvider).getAll();
}

@riverpod
Future<Volunteering> volunteeringGetByIdController(
    VolunteeringGetByIdControllerRef ref, String id) {
  return ref.read(volunteeringServiceProvider).get(id);
}

final volunteeringStreamProvider =
StreamProvider<Map<String, int>>((ref) {
  final serviceProvider = ref.read(volunteeringServiceProvider);
  serviceProvider.listenToVacantChanges();

  return serviceProvider.getVacantStream();
});


final specificVolunteeringStreamProvider =
StreamProvider.autoDispose.family<Map<String, int>, String>(
      (ref, id) {
    final serviceProvider = ref.read(volunteeringServiceProvider);
    serviceProvider.listenToSpecificVacantChanges(id);

    return serviceProvider.getVacantStream();
  },
);
