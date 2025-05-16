import '../../domain/repositories/validation_repository.dart';

class ValideRepositoryImpl implements ValideRepository{

  @override
  Future<bool> validePhoneNumber(final String phoneNumber) async {
    // 11자리인지 확인
    if (phoneNumber.length != 11) return false;

    // 숫자만 포함하는지 확인 (정규표현식 사용)
    final isDigitsOnly = RegExp(r'^\d{11}$').hasMatch(phoneNumber);

    return isDigitsOnly;
  }

  @override
  Future<bool> valideCode(final String valideCode) async {
    // 11자리인지 확인
    if (valideCode.length != 6) return false;

    // 숫자만 포함하는지 확인 (정규표현식 사용)
    final isDigitsOnly = RegExp(r'^\d{11}$').hasMatch(valideCode);

    return isDigitsOnly;
  }
}