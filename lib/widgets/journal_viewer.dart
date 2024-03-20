import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gap.dart';
import 'journal_entry.dart';

class JournalViewer extends StatelessWidget {
  const JournalViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Add docs on this action
        print('tapped');
      },
      child: Container(
        color: CupertinoColors.systemYellow,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 200.0,
                minHeight: 200.0,
              ),
              child: const SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    JournalEntry(
                      text: 'New Entry',
                    ),
                    JournalEntry(
                      text: 'New Entry',
                    ),
                    JournalEntry(
                      text: 'New Entry',
                    ),
                    JournalEntry(
                      text: 'New Entry',
                    ),
                    JournalEntry(
                      text: 'New Entry LATEST',
                    ),
                  ],
                ),
              ),
            ),
            const JournalInput(),
          ],
        ),
      ),
    );
  }
}

class JournalInput extends StatelessWidget {
  const JournalInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: CupertinoTextField(
              placeholder: 'Write...',
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: CupertinoColors.destructiveRed,
              child: const Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                size: 20.0,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
