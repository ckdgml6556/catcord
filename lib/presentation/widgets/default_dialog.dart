import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String dialogMessage;
  final VoidCallback onConfirm;

  const DefaultDialog({super.key, required this.title,required this.dialogMessage, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
      return AlertDialog(
      title: Text(title),
      content: Text(dialogMessage),
      actions: [
        ElevatedButton(onPressed: onConfirm, child: Text('확인')),
      ],
    );
  }
}