import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_note_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
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
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup(
            maxWidth: 400.0,
            maxHeight: 500.0,
            child: EditNotePopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: JournalEntryWidgetWrapper(
        appState: appState,
        note: journalEntry.note ?? '',
        children: [
          Text(detail),
        ],
      ),
    );
  }
}
