import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../mythic/fate_question.dart';
import 'chooseControlWidget.dart';
import 'control_data.dart';
import 'journal_controls.dart';

List<ControlData> getControlData(AppState appState) {
  List<ControlData> trackersData = [];
  List<ControlData> randomTableControlData = [];

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
    randomTableControlData.add(
      ControlData(
        controlId: randomTable.id,
        label: randomTable.title,
        controlType: ControlTypeEnum.randomTable,
        randomTable: randomTable,
      ),
    );
  }

  return [
    ...trackersData,
    ...mythicFateChartControls2(appState),
    ...mythicGMEControls(appState),
    ...randomTableControlData,
    ...initialNewItemControls,
  ];
}
