import '../repositories/validation_repository.dart';
import '../../domain/entities/api_request_state.dart';

class ValidationUsecase {
  final ValideRepository validationRepository;
  
  ValidationUsecase(this.validationRepository);

  Future<bool> checkPhoneString(final String phoneNumber) async {
    if (phoneNumber.length != 11) return false;

    final isDigitsOnly = RegExp(r'^\d{11}$').hasMatch(phoneNumber);

    return isDigitsOnly;
  }

  Future<bool> checkCodeString(final String code) async {
    if (code.length != 6) return false;

    final isDigitsOnly = RegExp(r'^\d{6}$').hasMatch(code);

    return isDigitsOnly;
  }

}