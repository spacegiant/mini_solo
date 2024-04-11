import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/dialogue_entry_widget.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';
import 'entryWidgets/mythic_entry_widget.dart';
import 'entryWidgets/oracle_entry_widget.dart';

List<Widget> getEntries(AppState appState) {
  List<JournalEntryItem>? journalItems = appState.campaignData?.journal;
  List<Widget> journalEntries = [];
  journalItems?.forEach((element) {
    switch (element.type) {
      case JournalEntryTypes.dialogue:
        journalEntries.add(DialogueEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.mythic:
        journalEntries.add(MythicEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.newScene:
        journalEntries.add(const Text('newScene'));
      case JournalEntryTypes.newClue:
        journalEntries.add(const Text('newClue'));
      case JournalEntryTypes.newCreature:
        journalEntries.add(const Text('newCreature'));
      case JournalEntryTypes.newPerson:
        journalEntries.add(const Text('newPerson'));
      case JournalEntryTypes.newThing:
        journalEntries.add(const Text('newThing'));
      case JournalEntryTypes.newFaction:
        journalEntries.add(const Text('newFaction'));
      case JournalEntryTypes.oracle:
        journalEntries.add(OracleEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.roll:
        journalEntries.add(const Text('roll'));
      case JournalEntryTypes.transition:
        journalEntries.add(const Text('transition'));

      default:
        return;
    }
  });
  return journalEntries;
}

class Journal extends StatelessWidget {
  const Journal({
    super.key,
    required this.items,
  });

  final List<JournalEntryItem> items;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        List<Widget> entries = getEntries(appState);
        return GestureDetector(
          onLongPress: () {
            appState.toggleShowPopup(PopupLabels.fullJournal);
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
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const JournalStartEntry(),
                        ...entries,
                        const JournalEndGlyphs(),
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
        return Column(
          children: [
            Padding(
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
            ),
          ],
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
        appState.toggleShowPopup(PopupLabels.journalFilter);
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
        appState.toggleShowPopup(PopupLabels.addJournalEntry);
      },
    );
  }
}
