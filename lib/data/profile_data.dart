import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class ProfileData {
  final FirebaseFirestore firebaseFirestore;

  ProfileData({required this.firebaseFirestore});

  Future<Profile> getProfile(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return Profile.fromJson(map);
  }
}
