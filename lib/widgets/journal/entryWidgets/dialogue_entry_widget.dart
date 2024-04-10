import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/app_state.dart';
import '../../../data/campaign_data.dart';

class DialogueEntryWidget extends StatelessWidget {
  final AppState appState;
  final JournalEntryItem journalEntry;

  const DialogueEntryWidget({
    super.key,
    required this.appState,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    Dialogue entry = appState.campaignData!.dialogue
        .firstWhere((entry) => entry.id == journalEntry.id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(entry.dialogue),
          Text(entry.speaker),
        ],
      ),
    );
  }
}
