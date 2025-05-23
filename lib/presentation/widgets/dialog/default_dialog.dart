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

void showDefaultDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => DefaultDialog(
      title: title,
      dialogMessage: message,
      onConfirm: onConfirm,
    ),
  );
}