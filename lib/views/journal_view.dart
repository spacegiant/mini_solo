import 'package:flutter/cupertino.dart';

class JournalView extends StatelessWidget {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Journal View'),
        Text('Filter needed'),
      ],
    );
  }
}
