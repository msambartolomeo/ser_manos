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

  Future<void> createUser(String uid, String name, String surname) async {
    final userRef = firebaseFirestore.collection("users").doc(uid);

    final user = User(uid: uid, name: name, surname: surname);

    userRef.set(user.toJson());
  }

  Future<void> updateUser(
    User user,
    String birthday,
    Gender gender,
    String image,
    String phone,
    String email,
  ) async {
    final userRef = firebaseFirestore.collection("users").doc(user.uid);

    final User updatedUser = User(
      uid: user.uid,
      name: user.name,
      surname: user.surname,
      birthday: birthday,
      gender: gender,
      image: image,
      phone: phone,
      email: email,
    );

    userRef.update(updatedUser.toJson());
  }
}
