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

  // ITERATE ALL GROUPS STORED IN ORDER
  for (Group group in groupList) {
    if (group.controls.isEmpty || group.isActive == false) continue;

    List<Widget> children = [];

    int? groupButtonColor = group.color;

    // ITERATE ALL CONTROLS STORED IN GROUP
    for (String groupControl in group.controls) {
      // TODO delete
      // appState.deleteEntityById(groupControl);
      if (appState.entityExists(groupControl) == false) {
        // TODO this needed?
      }
      // ITERATE ALL CONTROLS IN LISTOFCONTROLS
      for (ControlData control in listOfControls) {
        // CHECK IF CURRENT CONTROL MATCHES THE CURRENT GROUP CONTROL
        if (groupControl == control.controlId) {
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
          toggleShowPopup2(
              maxWidth: 400.0,
              maxHeight: 800.0,
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
