import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text("RESET"),
    );
  }
}
