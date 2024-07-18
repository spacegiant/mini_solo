import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_roll_table_result_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_settings_data.dart';
import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../gap.dart';

class RollTableResultWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const RollTableResultWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    RollTableResults entry = appState.campaignData!.rollTableResults
        .firstWhere((entry) => entry.id == journalEntry.id);

    List<Widget> resultsWidgets = [];

    for (var result in entry.results) {
      resultsWidgets.add(
        Row(
          children: [
            Text(
              result.resultString,
            ),
            if (appState.showMechanics) ...[
              const Gap(
                width: 4.0,
              ),
              Text(
                '· ${result.title} ${result.randomRoll}/${result.totalEntries}',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              )
            ],
          ],
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup(
            maxHeight: 340.0,
            maxWidth: 300.0,
            child: EditRollTableResultPopup(
              appState: appState,
              id: journalEntry.id,
            ),
            context: context);
      },
      child: JournalEntryWidgetWrapper(
        note: journalEntry.note ?? '',
        appState: appState,
        children: [
          JournalEntryLabel(
            label: 'Random Table: ${entry.title}',
          ),
          const Gap(
            height: 8.0,
          ),
          ...resultsWidgets,
        ],
      ),
    );
  }
}

class JournalEntryDetail extends StatelessWidget {
  const JournalEntryDetail({
    super.key,
    required this.details,
  });

  final List<String?> details;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<String> noNul = details.whereType<String>().toList();

    for (var i = 0; i < noNul.length; i++) {
      if (i > 0) {
        widgets.add(const Text(' | '));
      }
      widgets.add(Text(noNul[i]));
    }

    return Row(
      children: widgets,
    );
  }
}

class JournalEntryLabel extends StatelessWidget {
  const JournalEntryLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12.0,
      ),
    );
  }
}
