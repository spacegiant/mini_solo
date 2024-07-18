import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_new_scene_entry_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../data/data_structures/new_scene_entry.dart';

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
        toggleShowPopup(
            maxWidth: 400.0,
            maxHeight: 380.0,
            child: EditNewSceneEntryPopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: JournalEntryWidgetWrapper(
        appState: appState,
        note: journalEntry.note ?? '',
        children: [
          // Divider(
          //   thickness: 6.0,
          //   color: CupertinoColors.systemPink.withOpacity(0.5),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              entry.label,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
