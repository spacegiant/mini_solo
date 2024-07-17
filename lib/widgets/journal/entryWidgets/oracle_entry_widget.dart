import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/journal/entryWidgets/journal_entry_widget_wrapper.dart';
import 'package:mini_solo/widgets/popups/edit_oracle_entry_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../../data/app_state.dart';
import '../../../data/data_structures/journal_entry_item.dart';
import '../../../data/data_structures/oracle_entry.dart';

class OracleEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const OracleEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    OracleEntry entry = appState.campaignData!.oracle
        .firstWhere((entry) => entry.id == journalEntry.id);
    String? line1 = entry.lines.line1;
    String? line2 = entry.lines.line2;
    String? resultText = entry.lines.result;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        toggleShowPopup2(
            maxHeight: 340.0,
            maxWidth: 300.0,
            child: EditOracleEntryPopup(
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
            label: entry.label,
          ),
          if (appState.showMechanics)
            JournalEntryDetail(
              details: [line1, line2],
            ),
          JournalEntryResult(text: resultText),
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

class JournalEntryDiceRoll extends StatelessWidget {
  const JournalEntryDiceRoll({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(color: Colors.blueGrey),
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

class JournalEntryResult extends StatelessWidget {
  const JournalEntryResult({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
