import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/result_entries.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';

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

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        // toggleShowPopup2(
        //     child: EditResultPopup(appState: appState, id: journalEntry.id),
        //     context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
      ),
    );
  }
}
