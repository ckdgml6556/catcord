import 'package:catcord/domain/entities/api_request_state.dart';

abstract class ValideRepository {
  Future<bool> validePhoneNumber(final String phoneNumber);
  Future<bool> valideCode(final String valideCode);
}

