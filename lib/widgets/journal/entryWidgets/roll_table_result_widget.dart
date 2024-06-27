import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/edit_roll_table_result_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_settings_data.dart';
import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';

class RollTableResultWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const RollTableResultWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    RollTableResult entry = appState.campaignData!.rollTableResult
        .firstWhere((entry) => entry.id == journalEntry.id);
    String? resultText = entry.resultString;

    String calculation = '${entry.weight} in ${entry.totalEntries} chance';
    String roll = '${entry.totalEntries}d → ${entry.randomRoll + 1}';

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup2(
            child: EditRollTableResultPopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            JournalEntryLabel(
              label: 'Random Table: ${entry.title}',
            ),
            if (appState.showMechanics)
              JournalEntryDetail(
                details: [calculation, roll],
              ),
            JournalEntryResult(text: resultText),
          ],
        ),
      ),
    );
  }
}

class JournalEntryDetail extends StatelessWidget {
  const JournalEntryDetail({
    super.key,
    required this.details,
  });

  final List<String?> details;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<String> noNul = details.whereType<String>().toList();

    for (var i = 0; i < noNul.length; i++) {
      if (i > 0) {
        widgets.add(const Text(' | '));
      }
      widgets.add(Text(noNul[i]));
    }

    return Row(
      children: widgets,
    );
  }
}

// class JournalEntryDiceRoll extends StatelessWidget {
//   const JournalEntryDiceRoll({
//     super.key,
//     required this.text,
//   });
//
//   final String? text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text!,
//       style: const TextStyle(color: Colors.blueGrey),
//     );
//   }
// }

class JournalEntryLabel extends StatelessWidget {
  const JournalEntryLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12.0,
      ),
    );
  }
}

class JournalEntryResult extends StatelessWidget {
  const JournalEntryResult({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
