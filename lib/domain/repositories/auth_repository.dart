import '../../core/enums/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> login(String email, String password);
  Future<AuthState> logout();
  Future<AuthState> signup();
}