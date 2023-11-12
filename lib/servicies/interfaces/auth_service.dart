abstract class AuthService {
  AuthService();

  Future<void> login(String email, String password);

  Future<void> register(
    String name,
    String surname,
    String email,
    String password,
  );

  Future<void> logOut();
}
