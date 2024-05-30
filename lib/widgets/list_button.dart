import 'package:flutter/cupertino.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.labelAlignment = Alignment.centerLeft,
    this.color,
  });

  final String label;
  final Function() onPressed;
  final AlignmentGeometry? labelAlignment;
  final Color? color;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? CupertinoColors.systemPink,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
