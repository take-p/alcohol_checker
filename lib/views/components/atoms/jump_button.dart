import 'package:flutter/material.dart';

class JumpButton extends StatelessWidget {
  const JumpButton({
    super.key,
    required this.text,
    this.to,
  });

  final String text;
  final Widget? to;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          if (to != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => to!,
              ),
            );
          }
        },
        child: Text(text),
      ),
    );
  }
}
