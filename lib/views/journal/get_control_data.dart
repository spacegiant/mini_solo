import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../features/kard/kard.dart';
import '../mythic/fate_question.dart';
import 'chooseControlWidget.dart';
import 'control_data.dart';

List<ControlData> getControlData(AppState appState) {
  List<ControlData> trackersData = [];
  List<ControlData> randomTableControlData = [];
  List<ControlData> actionListControlData = [];
  List<ControlData> kardControlData = [];

  for (Kard kard in appState.campaignData!.kards) {
    trackersData.add(
      ControlData(
        controlId: kard.id,
        label: kard.title,
        controlType: kard.controlType,
      ),
    );
  }

  for (TrackerEntry tracker in appState.campaignData!.tracker) {
    trackersData.add(
      ControlData(
        controlId: tracker.id,
        label: tracker.label,
        controlType: tracker.controlType,
      ),
    );
  }

  for (RandomTableEntry randomTable in appState.appSettingsData.randomTables) {
    if (randomTable.isHidden == false) {
      randomTableControlData.add(
        ControlData(
          controlId: randomTable.id,
          label: randomTable.title,
          controlType: ControlTypeEnum.randomTable,
          randomTable: randomTable,
        ),
      );
    }
  }

  for (ActionListEntry actionList in appState.appSettingsData.actionLists) {
    if (actionList.isHidden == false) {
      actionListControlData.add(
        ControlData(
          controlId: actionList.id,
          label: actionList.title,
          controlType: ControlTypeEnum.actionList,
          actionList: actionList,
        ),
      );
    }
  }

  List<ControlData> controlData = [
    ...trackersData,
    ...mythicFateChartControls2(appState),
    ...mythicGMEControls(appState),
    ...randomTableControlData,
    ...actionListControlData,
    ...initialNewItemControls,
  ];

  // TODO test this!
  // TODO when should this run?
  // TODO is this needed?
  // check controls all have a group or add to unsorted
  for (final control in controlData) {
    bool isInAGroup = appState.findCurrentGroupId(control.controlId) != null;
    if (isInAGroup == false) {
      appState.moveToGroup(controlId: control.controlId, groupId: 'unsorted');
    }
  }

  return controlData;
}
