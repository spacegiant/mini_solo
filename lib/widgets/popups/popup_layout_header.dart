import 'package:flutter/cupertino.dart';

import '../gap.dart';

class PopupLayoutHeader extends StatelessWidget {
  const PopupLayoutHeader({
    super.key,
    this.icon,
    required this.label,
  });

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[Icon(icon), const Gap()],
        Text(label),
      ],
    );
  }
}
