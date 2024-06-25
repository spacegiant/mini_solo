import 'package:flutter/material.dart';

import '../../gap.dart';

class JournalSubheading extends StatelessWidget {
  final String label;
  const JournalSubheading({
    super.key,
    required this.label,
    this.handlePress,
    this.handleLongPress,
  });

  final void Function()? handlePress;
  final void Function()? handleLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePress!();
      },
      onLongPress: () {
        handleLongPress!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const Gap(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
