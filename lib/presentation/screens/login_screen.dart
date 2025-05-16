import 'package:catcord/presentation/widgets/images/logo_form.dart';
import 'package:catcord/presentation/widgets/input/phone_input_section.dart';
import 'package:catcord/providers/auth_provider.dart'; // provider 불러오기
import 'package:catcord/presentation/widgets/input/verift_input_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = TextEditingController();
    final codeController = TextEditingController();
    final isCodeSent = ref.watch(authProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 중앙 정렬
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: size.width * 0.4,
                child: const LogoForm(),
              ),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PhoneInputSection(
                controller: phoneController,
                onRequest: (){ref.read(authProvider.notifier).requestPhoneCode(phoneController.text);}
              ),
            ),
            if (isCodeSent) ...[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: PhoneVerifySection(
                  controller: codeController,
                  onRequest: (){ref.read(authProvider.notifier).verifyPhoneCode(phoneController.text);}
                )
              ),
            ],
          ],
        ),
      ),
    );
  }
}