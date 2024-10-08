import 'package:flutter/cupertino.dart';

import 'gap.dart';

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
    this.iconOnly = false,
  });

  final Widget label;
  final Function() onPressed;
  final AlignmentGeometry? labelAlignment;
  final Color? color;
  final Color? textColor;
  final Function()? onLongPress;
  final IconData? iconData;
  final bool? iconOnly;

  @override
  Widget build(BuildContext context) {
    Color? buttonColor = CupertinoColors.systemPink;
    const Color buttonTextColor = CupertinoColors.white;

    if (color != null) {
      buttonColor = color;
    } else if (iconData != null) {
      buttonColor = CupertinoColors.extraLightBackgroundGray;
    }

    Widget? child;

    if (iconOnly == true && iconData != null) {
      child = Icon(
        iconData,
        color: buttonTextColor,
        size: 20.0,
      );
    } else if (iconOnly == false && iconData != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: buttonTextColor,
            size: 16.0,
          ),
          const Gap(),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 320.0,
            ),
            child: label,
          )
        ],
      );
    } else {
      child = ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 340.0,
        ),
        child: label,
      );
    }

    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: DefaultTextStyle.merge(
          style: const TextStyle(color: CupertinoColors.white),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 10.0,
              ),
              child: child),
        ),
      ),
    );
  }
}
