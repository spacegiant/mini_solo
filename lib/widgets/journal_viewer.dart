import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            const JournalInputBar(),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoTextField(
                placeholder: 'Write...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JournalInputBar extends StatelessWidget {
  const JournalInputBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Filter here');
  }
}

class JournalInput extends StatelessWidget {
  const JournalInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoTextField(
      placeholder: 'Type here',
    );
  }
}
