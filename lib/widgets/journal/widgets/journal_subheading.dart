import 'package:flutter/material.dart';

import '../../gap.dart';

class JournalSubheading extends StatelessWidget {
  final String label;
  const JournalSubheading({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
