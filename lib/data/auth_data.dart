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
    } on FirebaseAuthException catch (e) {
      throw Exception(generateAuthExceptionMessage(e));
    }
  }

  Future<UID> register(String email, String password) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(generateAuthExceptionMessage(e));
    }
  }

  Future<void> logOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(generateAuthExceptionMessage(e));
    }
  }
}

String generateAuthExceptionMessage(FirebaseAuthException e) {
  return switch (e.code) {
    "INVALID_LOGIN_CREDENTIALS" =>
      "El usuario o contraseña ingresados son incorrectos",
    "email-already-in-use" => "El usuario ya se encuentra registrado",
    _ => "Se ha producido un error inesperado",
  };
}
