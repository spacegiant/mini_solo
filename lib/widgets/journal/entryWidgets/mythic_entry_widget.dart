import 'package:flutter/cupertino.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';
import 'oracle_entry_widget.dart';

class MythicEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const MythicEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    MythicEntry entry = appState.campaignData!.mythic
        .firstWhere((entry) => entry.id == journalEntry.id);
    String? line1 = entry.lines.line1;
    String? line2 = entry.lines.line2;
    String? resultText = entry.lines.result;

    return GestureDetector(
      onLongPress: () {
        // appState.setCurrentEntryId(entry.id);
        appState.toggleShowPopup(
          label: PopupLabel.editMythicEntry,
          id: entry.id,
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
            if (line1 != null) Text(line1),
            if (line2 != null) Text(line2),
            JournalEntryResult(text: resultText),
          ],
        ),
      ),
    );
  }
}
