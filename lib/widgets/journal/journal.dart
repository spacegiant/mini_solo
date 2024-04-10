import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';

List<Widget> getEntries(AppState appState) {
  List<JournalEntryItem>? journalItems = appState.campaignData?.journal;
  List<Widget> journalEntries = [];
  JournalEntryFactory factory = JournalEntryFactory();
  journalItems?.forEach((element) {
    Widget widget = factory.createEntry(element.type);
    journalEntries.add(widget);
  });
  return journalEntries;
}

Map<JournalEntryTypes, Widget> journalEntryWidgets = {
  JournalEntryTypes.dialogue: const Text('Dialogue'),
  JournalEntryTypes.mythic: const Text('Mythic'),
  JournalEntryTypes.newScene: const Text('NewScene'),
  JournalEntryTypes.newEntity: const Text('NewEntity'),
  JournalEntryTypes.newClue: const Text('newClue'),
  JournalEntryTypes.newCreature: const Text('NewCreature'),
  JournalEntryTypes.newPerson: const Text('newPerson'),
  JournalEntryTypes.newPlace: const Text('newPlace'),
  JournalEntryTypes.newThing: const Text('newThing'),
  JournalEntryTypes.newFaction: const Text('newFaction'),
  JournalEntryTypes.oracle: const Text('Oracle'),
  JournalEntryTypes.roll: const Text('Roll'),
  JournalEntryTypes.transition: const Text('Transition'),
};

List<Widget> sampleJournalEntries = [
  journalEntryWidgets[JournalEntryTypes.dialogue]!,
  journalEntryWidgets[JournalEntryTypes.mythic]!,
  journalEntryWidgets[JournalEntryTypes.newScene]!,
  journalEntryWidgets[JournalEntryTypes.newEntity]!,
  journalEntryWidgets[JournalEntryTypes.newClue]!,
  journalEntryWidgets[JournalEntryTypes.newCreature]!,
  journalEntryWidgets[JournalEntryTypes.newFaction]!,
  journalEntryWidgets[JournalEntryTypes.newPerson]!,
  journalEntryWidgets[JournalEntryTypes.newPlace]!,
  journalEntryWidgets[JournalEntryTypes.newThing]!,
  journalEntryWidgets[JournalEntryTypes.oracle]!,
  journalEntryWidgets[JournalEntryTypes.transition]!,
  journalEntryWidgets[JournalEntryTypes.roll]!,
];

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
