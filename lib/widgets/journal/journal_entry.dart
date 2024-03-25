import 'package:flutter/material.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry({
    super.key,
    this.label,
    required this.text,
    this.detail,
  });

  final String? label;
  final String text;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    // print(label);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        8.0,
        0.0,
        8.0,
        8.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(
              color: Colors.white,
            ),
            if (label != null)
              Text(
                label!,
              ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail != null) Text(detail!),
            // const Text(
            //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet egestas elit.'),
          ],
        ),
      ),
    );
  }
}
