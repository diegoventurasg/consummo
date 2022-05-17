import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.yesButton,
    required this.noButton,
  }) : super(key: key);

  final String title;
  final String message;
  final String yesButton;
  final String noButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(noButton),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(yesButton),
        ),
      ],
    );
  }
}
