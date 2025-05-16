import 'package:catcord/data/repositories/validation_repository.impl.dart';
import 'package:catcord/domain/usecases/validation_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ValidationViewModel extends StateNotifier<bool> {
  final ValidationUsecase validUseCase;

  ValidationViewModel(this.validUseCase) : super(false);

  Future<void> checkPhoneString(final String phoneNumber) async {
    state = await validUseCase.checkPhoneString(phoneNumber);
  }

  Future<void> checkVerifyCode(final String code) async {
    state = await validUseCase.checkCodeString(code);
  }
}

final validationProvider = StateNotifierProvider<ValidationViewModel, bool>((ref) {
  final repository = ValideRepositoryImpl(); // 실제 구현체
  final useCase = ValidationUsecase(repository);
  return ValidationViewModel(useCase);
});