abstract class AuthData {
  AuthData();

  Future<String> login(String email, String password);

  Future<String> register(String email, String password);

  Future<void> logOut();
}
