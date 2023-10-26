import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/models/models.dart';

class ProfileData {
  final FirebaseFirestore firebaseFirestore;

  ProfileData({required this.firebaseFirestore});

  Future<Profile> getProfile(String uid) async {
    final documentReference =
        await firebaseFirestore.collection("users").doc(uid).get();

    final map = documentReference.data()!;

    return Profile(
        name: map["name"],
        image: map["image"],
        email: map["email"],
        birthday: map["birthday"],
        gender: map["gender"],
        phone: map["phone"],
        favorites: List<String>.from(map["favorites"]),
        myVolunteering: map["myVolunteering"],
        aproved: map["aproved"]);
  }
}
