import '../views/journal/chooseControlWidget.dart';
import '../views/journal/control_data.dart';

List<ControlData> initialNewItemControls = [
  ControlData(
      controlId: 'new-tracker',
      label: 'New Tracker',
      controlType: ControlTypeEnum.newTracker),
  ControlData(
      controlId: 'new-random-table',
      label: 'New Random Table',
      controlType: ControlTypeEnum.newRandomTable),
  ControlData(
      controlId: 'new-group',
      label: 'New Group',
      controlType: ControlTypeEnum.newGroup),
  ControlData(
      controlId: 'new-kard',
      label: 'New Card',
      controlType: ControlTypeEnum.newCard),
  ControlData(
      controlId: 'new-action-list',
      label: 'New Action List',
      controlType: ControlTypeEnum.newActionList),
];

List<String> initialNewItemControlIds = [
  for (var control in initialNewItemControls) control.controlId
];
