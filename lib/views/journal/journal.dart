import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/note_entry_item.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/result_entry_widget.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/roll_table_result_widget.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../data/app_state.dart';
import '../../data/journal_entry_types.dart';
import '../../widgets/journal/entryWidgets/journal_start_entry.dart';
import '../../widgets/journal/entryWidgets/new_scene_entry_widget.dart';
import '../../widgets/journal/entryWidgets/note_entry_input.dart';
import '../../widgets/journal/entryWidgets/note_entry_widget.dart';
import '../../widgets/journal/entryWidgets/mythic_entry_widget.dart';
import '../../widgets/journal/entryWidgets/oracle_entry_widget.dart';
import '../../widgets/journal/entryWidgets/roll_entry_widget.dart';
import '../../widgets/journal/entryWidgets/temp_dice_display.dart';
import '../../widgets/journal/entryWidgets/tracker_entry_widget.dart';

List<Widget> getEntries(
  AppState appState,
  List<JournalEntryItem> journalItems,
) {
  List<Widget> journalEntries = [];
  if (journalItems.isEmpty) return [const SizedBox.shrink()];
  List<JournalEntryTypes>? hiddenEntryTypes = appState.hiddenEntryTypes;

  Color dividerColor = Colors.black.withOpacity(0.1);

  for (var element in journalItems) {
    if (hiddenEntryTypes!.contains(element.type)) {
      continue;
    }

    switch (element.type) {
      case JournalEntryTypes.mythic:
        journalEntries
            .add(MythicEntryWidget(appState: appState, journalEntry: element));
      case JournalEntryTypes.note:
        journalEntries
            .add(NoteEntryWidget(appState: appState, journalEntry: element));
      case JournalEntryTypes.newScene:
        journalEntries.add(
          NewSceneEntryWidget(
            appState: appState,
            journalEntry: element,
          ),
        );
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
      case JournalEntryTypes.rollTableResults:
        journalEntries.add(RollTableResultWidget(
          appState: appState,
          journalEntry: element,
        ));
      // case JournalEntryTypes.transition:
      //   journalEntries.add(const Text('transition'));
      case JournalEntryTypes.tracker:
        journalEntries.add(TrackerEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
      case JournalEntryTypes.resultEntry:
        journalEntries.add(ResultEntryWidget(
          appState: appState,
          journalEntry: element,
        ));
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
    required BoxConstraints constraints,
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
        List<JournalEntryItem>? journalItems = appState.campaignData?.journal;

        bool showFutureFeatures =
            appState.campaignData!.settings.general.showFutureSettings;
        List<Widget> entries = getEntries(appState, journalItems!);

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
          onTap: () {},
          child: Container(
            height: kForceColumnHeight,
            color: kJournalBackgroundColor,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const JournalStartEntry(),
                  ...entries,
                  if (widget.diceRoll!.isNotEmpty)
                    TempDiceDisplay(widget: widget),
                  NoteEntryInput(
                    controller: _controller,
                    onInputSubmit: onInputSubmit,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
