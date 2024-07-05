import 'package:flutter/cupertino.dart';

import '../../gap.dart';

class JournalStartEntry extends StatelessWidget {
  const JournalStartEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              color: CupertinoColors.placeholderText,
              child: const Text(
                'The Adventure Begins...',
                style: TextStyle(
                  color: CupertinoColors.systemGrey6,
                ),
              ),
            ),
            const Gap(),
          ],
        ),
      ),
    );
  }
}
