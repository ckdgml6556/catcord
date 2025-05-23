import 'package:catcord/data/repositories/auth_repository_impl.dart';
import 'package:catcord/core/enums/auth_state.dart';
import 'package:catcord/domain/usecases/auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewmodel extends StateNotifier<AuthState>{
  final AuthUsecase authUsecase;

  AuthViewmodel(this.authUsecase) : super(AuthState.none);

  Future<void> login(final String email, final String password) async {
    state = await authUsecase.login(email, password);
  }

  Future<void> logout() async {
    state = await authUsecase.logout();
  }

  Future<void> signup(final String email, final String pw1 , final String pw2) async {
    state = await authUsecase.singup(email, pw1, pw2);
  }
}

final authProvider = StateNotifierProvider<AuthViewmodel, AuthState>((ref) {
  final repository = AuthRepositoryImpl(); // 실제 구현체
  final useCase = AuthUsecase(repository);
  return AuthViewmodel(useCase);
});