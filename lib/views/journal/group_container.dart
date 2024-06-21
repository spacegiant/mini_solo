import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

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
    this.isVisible = true,
    required this.label,
    required this.groupId,
    required this.appState,
    required this.children,
    this.wrapControls = false,
  });

  final bool isVisible;
  final String label;
  final String groupId;
  final AppState appState;
  final List<Widget> children;
  final bool? wrapControls;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = appState.isExpanded(groupId);
    if (isVisible) {
      return GestureDetector(
        onLongPress: () {
          appState.toggleShowPopup(label: PopupLabel.editGroup);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JournalSubheading(
              label: label,
              handlePress: () {
                appState.toggleExpanded(groupId);
              },
            ),
            if (isExpanded)
              WrapManager(wrapControls: false, children: children),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
