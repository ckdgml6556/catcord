import 'package:flutter/material.dart';

class LogoForm extends StatelessWidget {
  const LogoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset('assets/images/cat_logo.png'),
    );
  }
}