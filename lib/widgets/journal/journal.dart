import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/note_entry_item.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../views/dice/dice_glyph.dart';
import 'entryWidgets/new_scene_entry_widget.dart';
import 'entryWidgets/note_entry_input.dart';
import 'entryWidgets/note_entry_widget.dart';
import 'entryWidgets/mythic_entry_widget.dart';
import 'entryWidgets/oracle_entry_widget.dart';
import 'entryWidgets/roll_entry_widget.dart';
import 'entryWidgets/temp_dice_display.dart';

List<Widget> getEntries(AppState appState) {
  List<JournalEntryItem>? journalItems = appState.campaignData?.journal;
  List<Widget> journalEntries = [];
  Color dividerColor = Colors.black.withOpacity(0.1);

  if (journalItems!.isEmpty) return [const SizedBox.shrink()];
  for (var element in journalItems) {
    switch (element.type) {
      case JournalEntryTypes.mythic:
        journalEntries.add(MythicEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.note:
        journalEntries.add(NoteEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.newScene:
        journalEntries.add(const NewSceneEntryWidget());
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
        journalEntries.add(RollEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.transition:
        journalEntries.add(const Text('transition'));

      default:
        continue;
    }
    if (element.type != JournalEntryTypes.newScene) {
      journalEntries.add(Divider(color: dividerColor));
    }
  }
  return journalEntries;
}

class Journal extends StatefulWidget {
  const Journal({
    super.key,
    required this.items,
    this.diceRoll,
    required this.addDice,
    required this.submitDice,
    required this.clearDice,
  });

  final List<JournalEntryItem> items;
  final List<DiceRoll>? diceRoll;
  final Function(List<DiceRoll>) addDice;
  final Function() submitDice;
  final Function() clearDice;

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  bool showInput = false;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        bool showFutureFeatures =
            appState.campaignData!.settings.general.showFutureSettings;
        List<Widget> entries = getEntries(appState);

        onInputSubmit() {
          if (_controller.text.characters.isNotEmpty) {
            NoteEntryItem entry = NoteEntryItem(
              isFavourite: false,
              detail: _controller.text.trim(),
            );
            appState.addNoteItem(entry);

            setState(() {
              _controller.clear();
            });
          }
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              showInput = !showInput;
            });
          },
          // onLongPress: () {
          //   appState.toggleShowPopup(PopupLabels.fullJournal);
          // },
          child: Container(
            color: CupertinoColors.systemTeal,
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 350.0,
                    maxHeight: 350.0,
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const JournalStartEntry(),
                        ...entries,
                        const JournalEndGlyphs(),
                        if (widget.diceRoll!.isNotEmpty)
                          TempDiceDisplay(widget: widget),
                        if (showInput)
                          NoteEntryInput(
                            controller: _controller,
                            onInputSubmit: onInputSubmit,
                          )
                      ],
                    ),
                  ),
                ),
                if (showFutureFeatures) const JournalInput(),
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
        appState.toggleShowPopup(label: PopupLabels.journalFilter);
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
        appState.toggleShowPopup(label: PopupLabels.addJournalEntry);
      },
    );
  }
}
