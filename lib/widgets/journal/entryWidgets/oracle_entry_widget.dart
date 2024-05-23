import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';
import '../../gap.dart';

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JournalEntryLabel(
            label: entry.label,
          ),
          JournalEntryDetail(
            details: [line1, line2],
          ),
          JournalEntryResult(text: resultText),
          const Gap(),
          const Divider(
            color: CupertinoColors.darkBackgroundGray,
          ),
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
