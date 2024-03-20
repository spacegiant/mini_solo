import 'package:flutter/cupertino.dart';

import 'journal_entry.dart';

class JournalViewer extends StatelessWidget {
  const JournalViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 200.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: CupertinoColors.systemYellow,
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            JournalEntry(),
            Text('journal entry here'),
            Text('journal entry here'),
            CupertinoTextField(
              placeholder: 'Type here',
            ),
          ],
        ),
      ),
    );
  }
}
