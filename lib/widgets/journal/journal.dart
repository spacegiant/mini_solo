import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/note_entry_item.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../views/dice/dice_glyph.dart';
import 'entryWidgets/journal_end_glyphs.dart';
import 'entryWidgets/journal_footer.dart';
import 'entryWidgets/journal_start_entry.dart';
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
        journalEntries
            .add(MythicEntryWidget(appState: appState, journalEntry: element));
      case JournalEntryTypes.note:
        journalEntries
            .add(NoteEntryWidget(appState: appState, journalEntry: element));
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
        journalEntries
            .add(OracleEntryWidget(appState: appState, journalEntry: element));
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
                if (showFutureFeatures) const JournalFooter(),
              ],
            ),
          ),
        );
      },
    );
  }
}
