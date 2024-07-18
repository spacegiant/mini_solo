import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_mythic_entry_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../data/data_structures/mythic_entry.dart';
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
    String meta = '· $line1 $line2';
    bool showMeta = line1 != null || line2 != null;

    return GestureDetector(
      onLongPress: () {
        toggleShowPopup2(
            maxHeight: 400.0,
            maxWidth: 300.0,
            child: EditMythicEntryPopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: JournalEntryWidgetWrapper(
        appState: appState,
        note: journalEntry.note,
        children: [
          JournalEntryLabel(
            label: entry.label,
          ),
          JournalEntryResult(text: resultText),
          if (showMeta)
            Text(
              '· $meta',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
        ],
      ),
    );
  }
}
