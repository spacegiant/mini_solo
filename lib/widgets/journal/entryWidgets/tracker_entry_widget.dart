import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/edit_tracker_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';

class TrackerEntryWidget extends StatelessWidget {
  const TrackerEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  final AppState appState;
  final JournalEntryItem journalEntry;

  @override
  Widget build(BuildContext context) {
    TrackerEntry entry = appState.campaignData!.tracker
        .firstWhere((entry) => entry.id == journalEntry.id);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup2(
            child: EditTrackerPopup(appState: appState, id: journalEntry.id),
            context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Created new tracker ${entry.label}'),
      ),
    );
  }
}
