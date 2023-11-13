import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/interfaces/user_data.dart';
import 'package:ser_manos/data/user_data_impl.dart';
import 'package:ser_manos/models/models.dart';

void main() {
  const String collectionId = "users";

  const User user1 = User(
    uid: "uid1",
    name: "John",
    surname: "Doe",
    email: "john@example.com",
  );

  const User user2 = User(
    uid: "uid2",
    name: "Jane",
    surname: "Doe",
    email: "jane@example.com",
  );

  late UserData userData;
  late FirebaseFirestore firestore;

  group("User Data Testing", () {
    setUp(() async {
      // Poblar la base de datos falsa.
      firestore = FakeFirebaseFirestore();
      await firestore
          .collection(collectionId)
          .doc(user1.uid)
          .set(user1.toJson());
      await firestore
          .collection(collectionId)
          .doc(user2.uid)
          .set(user2.toJson());
      userData = UserDataImplementation(firebaseFirestore: firestore);
    });

    test("Recuperar usuario", () async {
      expect(await userData.getUser(user1.uid), user1);
      expect(await userData.getUser(user2.uid), user2);
    });

    test("Crear usuario", () async {
      await userData.createUser("newUid", "New", "User");
      final newUser = await userData.getUser("newUid");
      expect(newUser.uid, "newUid");
      expect(newUser.name, "New");
      expect(newUser.surname, "User");
    });

    test("Actualizar usuario", () async {
      await userData.updateUser(
          user1.uid, const UserUpdate(completed: false, phone: "phone"));
      final updatedUser =
          await firestore.collection(collectionId).doc(user1.uid).get();
      expect(updatedUser.data()!["phone"], "phone");
    });

    test("Agregar favoritos", () async {
      await userData.addFavorite(user1.uid, "volunteering1");
      await userData.addFavorite(user1.uid, "volunteering2");
      final user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.favorites.contains("volunteering1"), true);
      expect(user.favorites.contains("volunteering1"), true);
      expect(user.favorites.length, 2);
    });

    test("Obtener favoritos", () async {
      await firestore.collection(collectionId).doc(user1.uid).update({
        "favorites": ["f1"]
      });
      final favorites = await userData.getFavorites(user1.uid);
      expect(favorites.contains("f1"), true);
      expect(favorites.length, 1);
    });

    test("Eliminar favoritos", () async {
      await firestore.collection(collectionId).doc(user1.uid).update({
        "favorites": ["f1"]
      });
      await userData.removeFavorite(user1.uid, "f1");
      final user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.favorites.length, 0);
    });

    test("Eliminar favoritos", () async {
      await firestore.collection(collectionId).doc(user1.uid).update({
        "favorites": ["f1", "f2"]
      });
      await userData.removeFavorite(user1.uid, "f1");
      final user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.favorites.contains("f2"), true);
      expect(user.favorites.length, 1);
    });

    test("Obtener favoritos", () async {
      final favorites = await userData.getFavorites(user1.uid);
      expect(favorites.length, 0);
    });

    test("Set application", () async {
      // Initial conditions
      var user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.application, null);

      // Action
      userData.setApplication(user1.uid, "volunteering1");

      // Assert
      user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.application != null, true);
      expect(user.application!.volunteering, "volunteering1");
      expect(user.application!.approved, false);
    });

    test("Remove application", () async {
      await firestore.collection(collectionId).doc(user1.uid).update({
        "application": {
          "volunteering": "id",
          "aproved": false,
        }
      });

      userData.deleteApplication(user1.uid);

      var user = User.fromJson(
          (await firestore.collection(collectionId).doc(user1.uid).get())
              .data()!);
      expect(user.application, null);
    });
  });
}
