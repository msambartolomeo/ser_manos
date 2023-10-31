

import 'package:ser_manos/data/favorites_data.dart';

class FavoritesService {
  final FavoritesData favoritesData;

  FavoritesService({required this.favoritesData});

  Future<List<String>> getFavorites(String uid) {
    return favoritesData.getFavorites(uid);
  }

  Future<void> addFavorite(String uid, String volunteering) {
    return favoritesData.addFavorite(uid, volunteering);
  }

  Future<void> removeFavorite(String uid, String volunteering) {
    return favoritesData.removeFavorite(uid, volunteering);
  }
}