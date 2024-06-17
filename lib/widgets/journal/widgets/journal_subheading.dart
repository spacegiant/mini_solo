import 'package:flutter/material.dart';

import '../../gap.dart';

class JournalSubheading extends StatelessWidget {
  final String label;
  const JournalSubheading({
    super.key,
    required this.label,
    this.handlePress,
  });

  final void Function()? handlePress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePress!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Divider(),
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
