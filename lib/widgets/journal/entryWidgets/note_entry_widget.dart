import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';
import '../../../data/note_entry_item.dart';

class NoteEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const NoteEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    NoteEntryItem entry = appState.campaignData!.notes
        .firstWhere((entry) => entry.id == journalEntry.id);

    String? detail = entry.detail;

    return GestureDetector(
      onLongPress: () {
        appState.setCurrentEntryId(entry.id);
        appState.toggleShowPopup(
          label: PopupLabels.editNote,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(detail),
      ),
    );
  }
}
