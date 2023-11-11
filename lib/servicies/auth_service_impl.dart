import 'package:ser_manos/data/auth_data.dart';
import 'package:ser_manos/servicies/interfaces/auth_service.dart';
import 'package:ser_manos/servicies/interfaces/user_service.dart';

class AuthServiceImplementation implements AuthService {
  final AuthData authData;
  final UserService userService;

  AuthServiceImplementation(
      {required this.authData, required this.userService});

  @override
  Future<void> login(String email, String password) async {
    await authData.login(email, password);
  }

  @override
  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    final UID uid = await authData.register(email, password);

    await userService.createUser(uid, name, surname);
  }

  @override
  Future<void> logOut() async {
    await authData.logOut();
  }
}
