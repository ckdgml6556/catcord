import 'package:catcord/core/enums/auth_state.dart';

import '../repositories/auth_repository.dart';
import '../../core/enums/api_request_state.dart';

class AuthUsecase {
  final AuthRepository authRepository;
  AuthUsecase(this.authRepository);

  Future<AuthState> login(final String email, final String password) async {
    // final AuthState state = await authRepository.login(email, password);

    return AuthState.unauth;
  }

  Future<AuthState> splashLogin(final String email, final String password) async {
    return AuthState.auth;
  }

  Future<AuthState> logout() async {
    return AuthState.auth;
  }

  Future<AuthState> singup(final String email, String pw1, String pw2) async {


    return AuthState.auth;
  }
}