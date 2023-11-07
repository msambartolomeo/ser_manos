

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class FavoritesData {
  final FirebaseFirestore firebaseFirestore;

  FavoritesData({required this.firebaseFirestore});

  Future<List<String>> getFavorites(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return User.fromJson(map).favorites;
  }

  Future<void> addFavorite(String uid, String volunteering) async {
    firebaseFirestore.collection("users").doc(uid).update({
      'favorites': FieldValue.arrayUnion([volunteering]),
    });
  }

  Future<void> removeFavorite(String uid, String volunteering) async {
    firebaseFirestore.collection("users").doc(uid).update({
    'favorites': FieldValue.arrayRemove([volunteering]),
  });
  }
}
