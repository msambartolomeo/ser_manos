import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class UserData {
  final FirebaseFirestore firebaseFirestore;

  UserData({required this.firebaseFirestore});

  Future<User> getUser(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return User.fromJson(map);
  }

  Future<void> setApplication(String uid, String volunteeringId) async {
    final documentReference = firebaseFirestore.collection("users").doc(uid);

    await documentReference.update({
      "application": {"volunteering": volunteeringId, "approved": false}
    }).then((value) => value,
        onError: (e) => throw Exception("Cuold not apply to volunteering."));
  }

  Future<void> deleteApplication(String uid) async {
    final documentReference = firebaseFirestore.collection("users").doc(uid);

    await documentReference.update({"application": null}).then((value) => value,
        onError: (e) => throw Exception("Cuold not apply to volunteering."));
  }

  Future<void> createUser(String uid, String name, String surname) async {
    final userRef = firebaseFirestore.collection("users").doc(uid);

    final user = User(uid: uid, name: name, surname: surname);

    userRef.set(user.toJson());
  }

  Future<void> updateUser(String uid, UserUpdate user) async {
    final userRef = firebaseFirestore.collection("users").doc(uid);

    final json = user.toJson();
    // NOTE: Remove empty values to only update user selected fields
    json.removeWhere((_, value) => value == null);

    userRef.update(json);
  }

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
