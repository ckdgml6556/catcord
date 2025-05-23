import 'package:catcord/data/repositories/validation_repository_impl.dart';
import 'package:catcord/domain/usecases/validation_usercase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ValidationViewModel extends StateNotifier<bool> {
  final ValidationUsercase validationUsercase;

  ValidationViewModel(this.validationUsercase) : super(false);

  Future<void> checkEmail(final String phoneNumber) async {
    state = await validationUsercase.validateEmailAddress(phoneNumber);
  }

  Future<void> checkPassword(final String password) async {
    state = await validationUsercase.validatePassword(password);
  }

    Future<void> checkMatchPasswords(final String pw1, final String pw2) async {
    state = await validationUsercase.validateMatchPassword(pw1, pw2);
  }
}

final validEmailProvider = StateNotifierProvider<ValidationViewModel, bool>((ref) {
  final repository = ValidationRepositoryImpl(); // 실제 구현체
  final useCase = ValidationUsercase(repository);
  return ValidationViewModel(useCase);
});

final validPasswordProvider = StateNotifierProvider<ValidationViewModel, bool>((ref) {
  final repository = ValidationRepositoryImpl(); // 실제 구현체
  final useCase = ValidationUsercase(repository);
  return ValidationViewModel(useCase);
});
