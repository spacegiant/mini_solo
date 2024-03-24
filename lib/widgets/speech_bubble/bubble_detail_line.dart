import 'package:flutter/cupertino.dart';

class BubbleDetailLine extends StatelessWidget {
  const BubbleDetailLine({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16.0,
        color: CupertinoColors.white,
      ),
    );
  }
}
