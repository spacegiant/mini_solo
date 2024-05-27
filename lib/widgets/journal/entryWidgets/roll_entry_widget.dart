import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';
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
        appState.setCurrentEntryId(entry.id);
        appState.toggleShowPopup(
          label: PopupLabels.editRoll,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
    );
  }
}
