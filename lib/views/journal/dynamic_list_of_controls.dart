import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../../widgets/popups/edit_group_popup.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import 'chooseControlWidget.dart';
import 'control_data.dart';
import 'group_container.dart';

List<GroupContainer> dynamicListOfControls(
  AppState appState,
  List<ControlData> listOfControls,
  BuildContext context,
) {
  List<GroupContainer> groupContainers = [];
  List<Group> groupList = appState.groupList;

  for (Group group in groupList) {
    if (group.controlsIDs.isEmpty || group.isActive == false) continue;

    List<Widget> children = [];

    int? groupButtonColor = group.color;

    for (String groupControlID in group.controlsIDs) {
      for (ControlData control in listOfControls) {
        if (groupControlID == control.controlId) {
          children.add(
            chooseControlWidget(
              controlData: control,
              appState: appState,
              context: context,
              color: groupButtonColor,
            ),
          );
        }
      }
    }

    groupContainers.add(
      GroupContainer(
        label: group.label,
        containerId: 'group-container-${group.groupId}',
        groupId: group.groupId,
        appState: appState,
        isWrapped: group.isWrapped,
        handleLongPress: () {
          toggleShowPopup(
              maxWidth: 400.0,
              maxHeight: 820.0,
              child: EditGroupPopup(
                appState: appState,
                group: group,
                controlData: listOfControls,
              ),
              context: context);
        },
        children: children,
      ),
    );
  }
  return groupContainers;
}
