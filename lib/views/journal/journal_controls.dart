import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_solo/features/grouping/group.dart';

import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/list_button.dart';
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
    ...mythicFateChartControls2,
    ...mythicGMEControls2,
    ...randomTableControlData,
  ];

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
        children: [
          diceTray(
            appState,
            addResult,
          ),
        ]),
    ...dynamicListOfControls(appState, controlData, appState.groupList),

    // TODO: Implement display of groups - sorting, visibility etc

    GroupContainer(
        label: 'New Item',
        containerId: 'newItems',
        appState: appState,
        groupId: 'newItems',
        children: [
          ListButton(
            label: 'New Tracker',
            onPressed: () {
              appState.toggleShowPopup(label: PopupLabel.createTracker);
            },
          ),
          ListButton(
            onPressed: () {
              appState.toggleShowPopup(label: PopupLabel.addRandomTable);
            },
            label: 'Add random table',
          ),
        ]),

    GroupContainer(
        label: 'Import/Export',
        containerId: 'importExport',
        appState: appState,
        groupId: 'importExport',
        children: [
          // TODO: Don't want this in journal controls. Move somewhere else.
          ListButton(
              label: 'Import Manager',
              onPressed: () {
                appState.toggleShowPopup(label: PopupLabel.importManager);
              }),
          ListButton(
              label: 'Export Campaign',
              onPressed: () async {
                CampaignData? campaignData = appState.campaignData;
                String jsonString =
                    appState.storage.getCampaignJSON(campaignData!);
                await Clipboard.setData(ClipboardData(text: jsonString));
                // copied successfully
              }),
          ListButton(
              label: 'Export AppSettings',
              onPressed: () async {
                AppSettingsData? appSettingsData = appState.appSettingsData;
                String jsonString =
                    appState.storage.appSettingsToJSON(appSettingsData);
                await Clipboard.setData(ClipboardData(text: jsonString));
                // copied successfully
              }),
        ])

    // const MarkdownBlock(
    //   newString: '# hello\n*hello* hello\n- hello',
    // ),
  ]);
}

List<ControlData> mythicGMEControls2 = [
  ControlData(
      controlId: 'mythic-new-scene',
      label: 'New Scene',
      controlType: ControlTypeEnum.newScene),
  ControlData(
      controlId: 'mythic-expected-scene',
      label: 'Test Expected Scene',
      controlType: ControlTypeEnum.mythicExpectedScene),
  ControlData(
      controlId: 'mythic-action',
      label: 'Mythic Action',
      controlType: ControlTypeEnum.mythicAction),
  ControlData(
      controlId: 'mythic-description',
      label: 'Mythic Description',
      controlType: ControlTypeEnum.mythicDescription),
  ControlData(
      controlId: 'mythic-event-focus',
      label: 'Mythic Event Focus',
      controlType: ControlTypeEnum.mythicEventFocus),
  ControlData(
      controlId: 'mythic-plot-twist',
      label: 'Mythic Plot Twist',
      controlType: ControlTypeEnum.mythicPlotTwist),
];

List<String> mythicGMEIds = [
  for (var control in mythicGMEControls2) control.controlId
];

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
  List<Group> groupList,
) {
  List<GroupContainer> groupContainers = [];

  for (Group group in groupList) {
    List<Widget> children = [];

    for (ControlData control in listOfControls) {
      // is it in group list?
      bool isInGroupList = group.controls.contains(control.controlId);
      if (isInGroupList) {
        Widget controlWidget =
            chooseControlWidget(controlData: control, appState: appState);
        children.add(controlWidget);
      }
    }

    if (group.controls.isEmpty == false) {
      groupContainers.add(GroupContainer(
        label: group.label,
        containerId: 'group-container-${group.groupId}',
        groupId: group.groupId,
        appState: appState,
        children: children,
      ));
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
