import 'package:catcord/constants/meterial.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onRequest;
  final String text;

  const MainButton({
    super.key,
    required this.onRequest,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cigMainGreen,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed:onRequest, 
                child: Text(text)
                );
  }
}
