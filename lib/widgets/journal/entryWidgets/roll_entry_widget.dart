import 'package:flutter/cupertino.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';
import '../../../views/dice/dice_glyph.dart';

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: CupertinoColors.systemIndigo,
            )),
        child: Wrap(
          children: [
            ...entry.result.map<Widget>(
              (roll) => DiceGlyph(
                rolledValue: roll.result,
                dieType: roll.diceType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
