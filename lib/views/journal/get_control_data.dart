import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/data_structures/tracker_entry.dart';
import '../../data/initial_new_item_controls.dart';
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
    auditControl(appState, kard.id);

    trackersData.add(
      ControlData(
        controlId: kard.id,
        label: kard.title,
        controlType: ControlTypeEnum.kard,
      ),
    );
  }

  for (TrackerEntry tracker in appState.campaignData!.tracker) {
    auditControl(appState, tracker.id);

    trackersData.add(
      ControlData(
        controlId: tracker.id,
        label: tracker.label,
        controlType: tracker.controlType,
      ),
    );
  }

  for (RandomTable randomTable in appState.appSettingsData.randomTables) {
    if (randomTable.isHidden == false) {
      auditControl(appState, randomTable.id);

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
      auditControl(appState, actionList.id);

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

  return controlData;
}

auditControl(AppState appState, String id) {
  String? groupId = appState.findCurrentGroupId(id);

  if (groupId == null) {
    appState.moveToGroup(
      controlId: id,
      groupId: 'unsorted',
      save: false,
    );
  }
}
