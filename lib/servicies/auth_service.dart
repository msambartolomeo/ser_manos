import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/servicies/user_service.dart';

class AuthService {
  final AuthData authData;
  final UserService userService;

  AuthService({required this.authData, required this.userService});

  Future<void> login(String email, String password) async {
    await authData.login(email, password);
  }

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    final UID uid = await authData.register(email, password);

    await userService.createUser(uid, name, surname);
  }

  Future<void> logOut() async {
    await authData.logOut();
  }
}
