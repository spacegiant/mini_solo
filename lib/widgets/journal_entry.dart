import 'package:flutter/cupertino.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
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
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet egestas elit.'),
          ],
        ),
      ),
    );
  }
}
