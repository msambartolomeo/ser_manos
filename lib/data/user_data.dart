import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class UserData {
  final FirebaseFirestore firebaseFirestore;

  UserData({required this.firebaseFirestore});

  Future<User?> getUser(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return User.fromJson(map);
  }

  Future<void> apply(String uid, String volunteeringId) async {
    final documentReference = firebaseFirestore.collection("users").doc(uid);

    await documentReference.update({
      "application": {"volunteering": volunteeringId, "approved": false}
    }).then((value) => value,
        onError: (e) => throw Exception("Cuold not apply to volunteering."));
  }

  Future<void> leaveCurrentVolunteering(String uid) async {
    final documentReference = firebaseFirestore.collection("users").doc(uid);

    await documentReference.update({"application": null}).then((value) => value,
        onError: (e) => throw Exception("Cuold not apply to volunteering."));
  }
}
