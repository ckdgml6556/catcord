import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  Future<void> requestPhoneCode(String phoneNumber) async {
    await Future.delayed(Duration(seconds: 1)); // 가짜 지연
    state = true;
  }

  Future<void> verifyPhoneCode(String phoneNumber) async {
    await Future.delayed(Duration(seconds: 1)); // 가짜 지연
    state = true;
  }
}