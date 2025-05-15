import 'package:catcord/constants/meterial.dart';
import 'package:catcord/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:catcord/constants/app_strings.dart';
import 'package:flutter/services.dart';


class PhoneInputSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onRequest;

  const PhoneInputSection({
    super.key,
    required this.controller,
    required this.onRequest,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
              LengthLimitingTextInputFormatter(11),   // 최대 11자리 (예: 01012345678)
            ],
            decoration: InputDecoration(
              hintText: AppStrings.loginPhoneInput,
              border: OutlineInputBorder(), // 기본 테두리
              focusedBorder: OutlineInputBorder( // 포커스 시 테두리
                borderSide: BorderSide(color: AppColors.cigMainGreen),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: SizedBox(
              width: double.infinity,
              child: MainButton(onRequest: onRequest, text: AppStrings.loginSendCode)
            ),
          )
        ]
      ),
    );
  }
}