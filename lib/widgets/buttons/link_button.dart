import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
