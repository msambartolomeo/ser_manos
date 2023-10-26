import 'package:ser_manos/data/auth_data.dart';

class AuthService {
  final AuthData authData;
  AuthService({required this.authData});

  Future<void> login(String email, String password) async {
    await authData.login(email, password);
  }

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    await authData.register(email, password);
    // TODO: register User in firestore
  }

  Future<void> logOut() async {
    await authData.logOut();
  }
}
