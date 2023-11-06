import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

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

    final service = ref.read(favoritesServiceProvider);

    return await service.getFavorites(uid);
  }

  FutureOr<void> addFavorite(String volunteeringId) {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(favoritesServiceProvider);

    return service.addFavorite(uid, volunteeringId);
  }

  FutureOr<void> removeFavorite(String volunteeringId) {
    final UID? uid = _getUserId();

    if (uid == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(favoritesServiceProvider);

    return service.removeFavorite(uid, volunteeringId);
  }

  String? _getUserId() {
    final user = ref.read(currentAuthUserProvider);

    return user?.uid;
  }
}
