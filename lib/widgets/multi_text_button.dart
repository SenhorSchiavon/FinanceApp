
import 'package:flutter/material.dart';

class MultiTextButtom extends StatelessWidget {
  final List<Text> children;
  final VoidCallback onPressed;
  const MultiTextButtom({super.key, required this.children, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
