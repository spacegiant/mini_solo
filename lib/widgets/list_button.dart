import 'package:flutter/cupertino.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.labelAlignment = Alignment.centerLeft,
    this.color,
    this.iconData,
    this.textColor,
  });

  final String label;
  final Function() onPressed;
  final AlignmentGeometry? labelAlignment;
  final Color? color;
  final Color? textColor;
  final Function()? onLongPress;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    Color? buttonColor = CupertinoColors.systemPink;
    Color? buttonTextColor = CupertinoColors.white;

    if (color != null) {
      buttonColor = color;
    } else if (iconData != null) {
      buttonColor = CupertinoColors.extraLightBackgroundGray;
    }

    if (textColor != null) {
      buttonTextColor = textColor;
    } else if (iconData != null) {
      buttonTextColor = CupertinoColors.black;
    }

    StatelessWidget? child = iconData != null
        ? Icon(
            iconData,
            color: buttonTextColor,
            size: 20.0,
          )
        : Text(
            label,
            style: TextStyle(
              color: buttonTextColor,
            ),
          );

    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 10.0,
            ),
            child: child),
      ),
    );
  }
}
