import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/app_state.dart';
import 'journal_entry.dart';

class JournalViewer extends StatelessWidget {
  const JournalViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        return GestureDetector(
          onLongPress: () {
            appState.setPopupLabel(PopupLabels.fullJournal);
            appState.toggleShowPopup();
          },
          child: Container(
            color: CupertinoColors.systemTeal,
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
                        JournalStartEntry(),
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
                        JournalEndGlyphs()
                      ],
                    ),
                  ),
                ),
                const JournalInput(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class JournalStartEntry extends StatelessWidget {
  const JournalStartEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: Text('The Adventure Begins...')),
    );
  }
}

class JournalEndGlyphs extends StatelessWidget {
  const JournalEndGlyphs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          '❊❊❊',
          style: TextStyle(
            color: Colors.blueGrey,
          ),
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
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              addJournalEntryButton(appState),
              const SizedBox(
                width: 16.0,
              ),
              jumpToFirstButton(),
              const SizedBox(
                width: 4.0,
              ),
              jumpToLatestButton(),
              const SizedBox(
                width: 4.0,
              ),
              journalFilterButton(appState)
            ],
          ),
        );
      },
    );
  }

  CupertinoButton journalFilterButton(AppState appState) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.line_horizontal_3_decrease,
        size: 20.0,
      ),
      onPressed: () {
        appState.setPopupLabel(PopupLabels.journalFilter);
        appState.toggleShowPopup();
      },
    );
  }

  CupertinoButton jumpToLatestButton() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.arrow_down_to_line,
        size: 20.0,
      ),
      onPressed: () {},
    );
  }

  CupertinoButton jumpToFirstButton() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.arrow_up_to_line,
        size: 20.0,
      ),
      onPressed: () {},
    );
  }

  CupertinoButton addJournalEntryButton(AppState appState) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      child: const Icon(
        CupertinoIcons.add,
        size: 20.0,
        color: CupertinoColors.black,
      ),
      onPressed: () {
        appState.setPopupLabel(PopupLabels.addJournalEntry);
        appState.toggleShowPopup();
      },
    );
  }
}
