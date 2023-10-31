import 'package:firebase_auth/firebase_auth.dart';

typedef UID = String;

class AuthData {
  final FirebaseAuth firebaseAuth;

  AuthData({required this.firebaseAuth});

  Future<UID> login(String email, String password) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response.user!.uid;
    } on FirebaseAuthException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }

  Future<UID> register(String email, String password) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response.user!.uid;
    } on FirebaseAuthException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }
}
