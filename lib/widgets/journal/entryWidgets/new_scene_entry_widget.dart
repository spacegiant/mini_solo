import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';

import '../../../data/app_state.dart';

class NewSceneEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const NewSceneEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    NewSceneEntry entry = appState.campaignData!.newScene
        .firstWhere((entry) => entry.id == journalEntry.id);
    return GestureDetector(
      onLongPress: () {
        appState.setCurrentEntryId(entry.id);
        appState.toggleShowPopup(
          label: PopupLabel.editNewSceneEntry,
        );
      },
      child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              entry.label,
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          )),
    );
  }
}
