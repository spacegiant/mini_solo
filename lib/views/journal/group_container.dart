import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../widgets/journal/widgets/journal_subheading.dart';

Map<String, String> journalGroups = {
  'mythicFateChart': 'Mythic Fate Chart',
  'mythicGME': 'Mythic GME',
  'randomTables': 'Random Tables',
  'trackers': 'Trackers',
  'newItem': 'New Item',
  'importExport': 'Import/Export',
};

class GroupContainer extends StatelessWidget {
  const GroupContainer({
    super.key,
    required this.children,
    required this.isExpanded,
    required this.label,
    required this.groupId,
    required this.appState,
  });

  final List<Widget> children;
  final bool isExpanded;
  final String label;
  final String groupId;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      JournalSubheading(label: label),
      if (isExpanded) ...children,
    ]);
  }
}
