abstract class ValidationRepository {
  Future<bool> valideEmail(final String email);
  Future<bool> validePassword(final String password);
  Future<bool> valideMatchPassword(final String pw1, pw2);
}
