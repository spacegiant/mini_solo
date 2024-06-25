import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_solo/features/grouping/group.dart';
import 'package:mini_solo/widgets/popups/add_group_popup.dart';
import 'package:mini_solo/widgets/popups/add_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/add_tracker_popup.dart';
import 'package:mini_solo/widgets/popups/edit_groups_popup.dart';

import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/list_button.dart';
import '../../widgets/popups/edit_group_popup.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import '../../widgets/view_wrapper.dart';
import '../mythic/fate_question.dart';
import 'chooseControlWidget.dart';
import 'dice_tray.dart';
import 'group_container.dart';

Widget journalControls(
    AppState appState,
    void Function(List<DiceRoll> result) addResult,
    // bool wrapControls,
    BuildContext context) {
  bool wrapControls = appState.wrapControls;

  List<ControlData> trackerControlData = [];

  for (TrackerEntry tracker in appState.campaignData!.tracker) {
    trackerControlData.add(ControlData(
        controlId: tracker.id,
        label: tracker.label,
        controlType: tracker.controlType));
  }

  List<ControlData> randomTableControlData = [];

  for (RandomTableEntry randomTable in appState.appSettingsData.randomTables) {
    randomTableControlData.add(
      ControlData(
        controlId: randomTable.id,
        label: randomTable.title,
        controlType: ControlTypeEnum.randomTable,
        randomTable: randomTable,
      ),
    );
  }

  List<ControlData> controlData = [
    ...trackerControlData,
    ...mythicFateChartControls2(appState),
    ...mythicGMEControls(appState),
    ...randomTableControlData,
    ...initialNewItemControls,
  ];

  // GET GROUPS IN ORDER
  for (var group in appState.groupList) {
    print(group.label);
  }

  // TODO test this!
  // check controls all have a group or add to unsorted
  for (final control in controlData) {
    bool isInAGroup = appState.findCurrentGroupId(control.controlId) != null;
    if (isInAGroup == false) {
      appState.moveToGroup(controlId: control.controlId, groupId: 'unsorted');
    }
  }

  auditGroupItems(appState);

  return ViewWrapper(children: [
    // ...diceControls(addResult).values,
    GroupContainer(
        label: 'Dice',
        containerId: 'group-dice',
        appState: appState,
        showDivider: false,
        groupId: 'group-dice',
        handleLongPress: () {},
        children: [
          diceTray(
            appState,
            addResult,
          ),
        ]),
    ...dynamicListOfControls(appState, controlData, context),

    // const MarkdownBlock(
    //   newString: '# hello\n*hello* hello\n- hello',
    // ),
  ]);
}

class ControlData {
  final String controlId;
  final String label;
  final FateChartRow? fateChartRow;
  final RandomTableEntry? randomTable;

  // final String group;
  final ControlTypeEnum controlType;

  ControlData({
    required this.controlId,
    required this.label,
    required this.controlType,
    this.fateChartRow,
    this.randomTable,
  });
}

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
        ;
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

void auditGroupItems(AppState appState) {
  List<String> allGroupedItems = [];

  for (var group in appState.campaignData!.groups) {
    allGroupedItems.addAll(group.controls);
  }
}
