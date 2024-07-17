import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/result_entries.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../features/action_lists/edit_result_popup.dart';
import '../../gap.dart';
import '../../popups/toggle_show_popup.dart';
import 'journal_entry_widget_wrapper.dart';

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
    ResultEntriesCollection entry = appState.campaignData!.resultEntries
        .firstWhere((entry) => entry.id == journalEntry.id);

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
      child: JournalEntryWidgetWrapper(
        note: journalEntry.note ?? '',
        appState: appState,
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
              return Row(
                children: [
                  Text(item.title),
                  if (item.detail != null)
                    Text(
                      item.detail!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                    ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
