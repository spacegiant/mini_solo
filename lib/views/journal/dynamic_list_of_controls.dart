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
    List<Widget> children = [];

    int? groupButtonColor = group.color;

    // TODO: Below is code needed to handle ungrouped controls, if ever needed.
    // List<Widget> ungrouped = [];
    //
    // Map<String, String> test = {};
    //
    // for (ControlData control in listOfControls) {
    //   Map<String, String> newItem = {};
    //   for (String groupControl in group.controls) {
    //     if (groupControl == control.controlId) {
    //       newItem = {control.controlId: group.groupId};
    //     }
    //   }
    //   test.addAll(newItem);
    // }
    //
    // Map<String, String> test2 = {};
    // test.forEach((key, value) {
    //   if (value == '') {
    //     test2.addAll({key: value});
    //   }
    // });

    for (String groupControl in group.controls) {
      for (ControlData control in listOfControls) {
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

    if (group.controls.isEmpty == false) {
      groupContainers.add(
        GroupContainer(
          label: group.label,
          containerId: 'group-container-${group.groupId}',
          groupId: group.groupId,
          appState: appState,
          children: children,
          handleLongPress: () {
            toggleShowPopup2(
                child: EditGroupPopup(
                  appState: appState,
                  group: group,
                  controlData: listOfControls,
                ),
                context: context);
          },
        ),
      );
    }
  }
  return groupContainers;
}
