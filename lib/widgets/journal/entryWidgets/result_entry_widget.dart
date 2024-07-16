import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/result_entries.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../features/action_lists/edit_result_popup.dart';
import '../../gap.dart';
import '../../popups/toggle_show_popup.dart';

class ResultEntryWidget extends StatelessWidget {
  const ResultEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  final AppState appState;
  final JournalEntryItem journalEntry;

  @override
  Widget build(BuildContext context) {
    ResultEntries entry = appState.campaignData!.resultEntries
        .firstWhere((entry) => entry.id == journalEntry.id);

    List<Widget> note = journalEntry.note != null && journalEntry.note != ''
        ? [
            const Gap(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: CupertinoColors.systemYellow,
              child: Text(
                journalEntry.note!,
                style: const TextStyle(fontSize: 12.0),
              ),
            )
          ]
        : [];

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup2(
          maxHeight: 600.0,
          maxWidth: 400.0,
          child: EditResultPopup(appState: appState, id: journalEntry.id),
          context: context,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO Make this clearer
            Text(
              entry.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...entry.list.map((item) {
              if (item.type == ResultEntryTypes.label) {
                return Text(
                  item.title,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                );
              } else {
                return Text(item.title);
              }
            }),
            ...note,
          ],
        ),
      ),
    );
  }
}
