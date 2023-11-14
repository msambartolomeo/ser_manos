import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/models/models.dart';
import 'package:ser_manos/providers/geolocation_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/interfaces/volunteering_service.dart';

part 'generated/volunteering_controllers.g.dart';

@riverpod
class VolunteeringController extends _$VolunteeringController {
  String? _search;

  @override
  FutureOr<List<Volunteering>?> build() async {
    final VolunteeringService volunteeringService =
        ref.read(volunteeringServiceProvider);

    return await ref.watch(determineGeolocationProvider).when(
          data: (geolocation) async =>
              await volunteeringService.getAll(geolocation, _search),
          error: (_, __) async =>
              await volunteeringService.getAll(null, _search),
          loading: () => null,
        );
  }

  void setSearch(String? search) async {
    _search = search;

    ref.invalidateSelf();
  }
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
