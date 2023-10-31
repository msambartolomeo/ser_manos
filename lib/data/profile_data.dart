import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class ProfileData {
  final FirebaseFirestore firebaseFirestore;

  ProfileData({required this.firebaseFirestore});

  Future<Profile?> getProfile(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return Profile.fromJson(map);
  }

  Future<void> apply(String uid, String volunteeringId) async {
    final documentReference = firebaseFirestore.collection("users").doc(uid);

    await documentReference
        .update({"myVolunteering": volunteeringId, "aproved": false}).then(
            (value) => value,
            onError: (e) =>
                throw Exception("Cuold not apply to volunteering."));
  }
}
