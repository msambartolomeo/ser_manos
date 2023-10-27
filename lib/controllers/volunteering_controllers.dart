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
