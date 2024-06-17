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
    this.isExpanded = true,
    this.isVisible = true,
    required this.label,
    required this.groupId,
    required this.appState,
    required this.children,
  });

  final bool isExpanded;
  final bool isVisible;
  final String label;
  final String groupId;
  final AppState appState;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JournalSubheading(label: label),
              if (isExpanded) ...children,
            ],
          )
        : const SizedBox.shrink();
  }
}
