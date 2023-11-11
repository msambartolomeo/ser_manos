import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';

part 'generated/favorites_controller.g.dart';

typedef UID = String;

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<List<String>> build() async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final UserService service = ref.read(userServiceProvider);

    return await service.getFavorites(uid);
  }

  Future<void> addFavorite(String volunteeringId) async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final UserService service = ref.read(userServiceProvider);

    service.addFavorite(uid, volunteeringId);

    state = state.whenData((data) {
      return [...data, volunteeringId];
    });
  }

  Future<void> removeFavorite(String volunteeringId) async {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final UserService service = ref.read(userServiceProvider);

    service.removeFavorite(uid, volunteeringId);

    state = state.whenData((data) {
      data.remove(volunteeringId);
      return data;
    });
  }

  String? _getUserId() {
    final user = ref.read(currentAuthUserProvider);

    return user?.uid;
  }
}
