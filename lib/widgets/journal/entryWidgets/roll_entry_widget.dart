import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_rolls_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../data/data_structures/roll_entry_item.dart';
import '../../../views/dice/dice_glyph.dart';
import 'oracle_entry_widget.dart';

class RollEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const RollEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    RollEntryItem entry = appState.campaignData!.rolls
        .firstWhere((entry) => entry.id == journalEntry.id);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup2(
            maxHeight: 340.0,
            maxWidth: 300.0,
            child: EditRollPopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: JournalEntryWidgetWrapper(
        note: journalEntry.note ?? '',
        appState: appState,
        children: [
          JournalEntryLabel(
            label: entry.label,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Wrap(
              children: [
                ...entry.result.map<Widget>(
                  (roll) => DiceGlyph(
                    diceRoll: roll,
                    dieType: roll.diceType,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
