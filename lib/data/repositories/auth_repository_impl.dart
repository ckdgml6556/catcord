import 'package:catcord/core/enums/auth_state.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<AuthState> login(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<AuthState> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthState> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }
  
}
