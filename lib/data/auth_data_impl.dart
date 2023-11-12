import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/data/interfaces/auth_data.dart';

typedef UID = String;

class AuthDataImplementation implements AuthData {
  final FirebaseAuth firebaseAuth;

  AuthDataImplementation({required this.firebaseAuth});

  @override
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

  @override
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

  @override
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
