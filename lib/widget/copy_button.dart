import 'package:flutter/material.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text("COPY"),
    );
  }
}
