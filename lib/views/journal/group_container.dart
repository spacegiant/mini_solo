import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../../widgets/gap.dart';
import '../../widgets/journal/widgets/journal_subheading.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import 'control_data.dart';
import 'get_control_data.dart';

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
    this.isWrapped = false,
    this.showDivider = true,
    required this.groupId,
    required this.handleLongPress,
  });

  final bool isVisible;
  final String label;
  final String containerId;
  final String groupId;
  final AppState appState;
  final List<Widget> children;
  final bool? isWrapped;
  final bool? showDivider;
  final Function() handleLongPress;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = appState.isExpanded(containerId);
    if (isVisible) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          showDivider == true
              ? const Divider(
                  thickness: 0.0,
                )
              : const Gap(),
          JournalSubheading(
            label: isExpanded ? label : '$label (${children.length})',
            isExpanded: isExpanded,
            handleMinimiseToggle: () {
              appState.toggleExpanded(containerId);
            },
            showGroupSettingsPopup: () {
              handleLongPress();
            },
            toggleShowGroupFullscreen: () {
              toggleShowPopup(
                  maxHeight: 800.0,
                  maxWidth: 600.0,
                  child: PopupLayout(
                    header: PopupLayoutHeader(label: label),
                    body: Expanded(
                      child: SingleChildScrollView(
                        child: Consumer<AppState>(
                          builder: (BuildContext context, AppState value,
                              Widget? child) {
                            List<ControlData> controlDataList =
                                getControlDataList(appState);
                            Group group = appState.getGroup(groupId);

                            List<Widget> children = [];

                            for (final groupControlId in group.controlsIDs) {
                              ControlData? controlData = controlDataList
                                  .firstWhereOrNull((controlData) =>
                                      controlData.controlId == groupControlId);

                              if (controlData != null) {
                                Widget childWidget = chooseControlWidget(
                                  controlData: controlData,
                                  appState: appState,
                                  context: context,
                                  color: group.color,
                                );
                                children.add(childWidget);
                              }
                            }

                            return WrapManager(
                                wrapControls: true, children: children);
                          },
                        ),
                      ),
                    ),
                    footer: null,
                  ),
                  context: context);
            },
          ),
          if (isExpanded)
            WrapManager(wrapControls: isWrapped ?? false, children: children),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
