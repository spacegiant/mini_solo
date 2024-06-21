import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
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
    required this.containerId,
    required this.appState,
    required this.children,
    this.wrapControls = false,
    this.showDivider = true,
    required this.groupId,
  });

  final bool isVisible;
  final String label;
  final String containerId;
  final String groupId;
  final AppState appState;
  final List<Widget> children;
  final bool? wrapControls;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = appState.isExpanded(containerId);
    if (isVisible) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showDivider == true
              ? const Divider(
                  thickness: 0.0,
                )
              : const Gap(),
          JournalSubheading(
            label: isExpanded ? label : '$label (${children.length})',
            handlePress: () {
              appState.toggleExpanded(containerId);
            },
            handleLongPress: () {
              appState.toggleShowPopup(
                  label: PopupLabel.editGroup, id: groupId);
            },
          ),
          if (isExpanded) WrapManager(wrapControls: false, children: children),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
