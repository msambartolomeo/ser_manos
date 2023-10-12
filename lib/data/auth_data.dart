import 'package:firebase_auth/firebase_auth.dart';

class AuthData {
  final FirebaseAuth firebaseAuth;

  AuthData({required this.firebaseAuth});

  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      // TODO: Handle error
      rethrow;
    }
  }
}
