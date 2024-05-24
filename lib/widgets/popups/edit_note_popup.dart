import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../data/note_entry_item.dart';

class EditNotePopup extends StatelessWidget {
  const EditNotePopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(
    BuildContext context,
  ) {
    String currentEntryId = appState.currentEntryId;
    NoteEntryItem entry = appState.campaignData!.notes
        .firstWhere((entry) => entry.id == currentEntryId);
    return Column(
      children: [
        Text(entry.detail),
      ],
    );
  }
}
