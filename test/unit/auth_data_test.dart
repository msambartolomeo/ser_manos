import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/auth_data_impl.dart';
import 'package:ser_manos/data/interfaces/auth_data.dart';

void main() {
  group("Auth Data Testing", () {
    late FirebaseAuth firebaseAuth;
    late AuthData authData;

    setUp(() async {
      firebaseAuth = MockFirebaseAuth();
      authData = AuthDataImplementation(firebaseAuth: firebaseAuth);
    });

    test("Register", () async {
      await authData.register("register", "register");

      expect(firebaseAuth.currentUser != null, true);
      expect(firebaseAuth.currentUser!.email, "register");
      await firebaseAuth.signOut();
    }, tags: ["unit", "auth"]);

    test("Login", () async {
      firebaseAuth.createUserWithEmailAndPassword(
          email: "email", password: "password");
      await firebaseAuth.signOut();
      await authData.login("email", "password");

      expect(firebaseAuth.currentUser != null, true);
      expect(firebaseAuth.currentUser!.email, "email");
    }, tags: ["unit", "auth"]);

    test("Login", () async {
      firebaseAuth.createUserWithEmailAndPassword(
          email: "email", password: "password");
      await authData.logOut();

      expect(firebaseAuth.currentUser, null);
    }, tags: ["unit", "auth"]);
  });
}
