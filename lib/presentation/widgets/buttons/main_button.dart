import 'package:catcord/core/constants/meterial.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onRequest;
  final String text;
  final bool isEnable;

  const MainButton({
    super.key,
    required this.text,
    required this.onRequest,
    required this.isEnable
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onRequest,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable ?  AppColors.buttonMainColor: AppColors.disableGray,
        foregroundColor: isEnable ?AppColors.white :AppColors.disableTextBlack,
        minimumSize: const Size.fromHeight(48),
      ),
      child: Text(text),
    );
  }
}