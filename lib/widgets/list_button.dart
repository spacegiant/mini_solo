import 'package:flutter/cupertino.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelAlignment = Alignment.centerLeft,
    this.color,
  });

  final String label;
  final Function() onPressed;
  final AlignmentGeometry? labelAlignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = color ?? CupertinoColors.systemPink;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CupertinoButton(
        color: buttonColor,
        onPressed: onPressed,
        alignment: labelAlignment!,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0,
        ),
        child: Text(
          label,
        ),
      ),
    );
  }
}
