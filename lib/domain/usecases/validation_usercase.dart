// class AuthUsecase {
  import 'package:catcord/domain/repositories/validation_repository.dart';

class ValidationUsercase {
  final ValidationRepository validationRepository;
  
  ValidationUsercase(this.validationRepository);

  Future<bool> validateEmailAddress(final String email) async {
    final isEmailFormat = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);

    return isEmailFormat;
  }

  Future<bool> validatePassword(final String password) async {
    final isPasswordFormat = RegExp(r'^[A-Za-z0-9]{6,10}$').hasMatch(password);

    return isPasswordFormat;
  }

  Future<bool> validateMatchPassword(final String pw1,final String pw2) async {
    return pw1 == pw2;
  }
}