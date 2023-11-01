import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/current_user_provider.dart';
import 'package:ser_manos/providers/servicies_providers.dart';

part 'generated/favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<List<String>> build() async {
    final User? user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(favoritesServiceProvider);

    return await service.getFavorites(user.uid);
  }

  FutureOr<void> addFavorite(String volunteeringId) {
    final User? user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(favoritesServiceProvider);

    service.addFavorite(user.uid, volunteeringId);

    state = state.whenData((data) {
      return [...data, volunteeringId];
    });
  }

  FutureOr<void> removeFavorite(String volunteeringId) {
    final User? user = ref.read(currentUserProvider);

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final service = ref.read(favoritesServiceProvider);

    service.removeFavorite(user.uid, volunteeringId);

    state = state.whenData((data) {
      data.remove(volunteeringId);
      return data;
    });
  }
}
