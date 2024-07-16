import '../../views/journal/chooseControlWidget.dart';
import '../../views/journal/control_data.dart';

List<ControlData> initialMythicGMEControls = [
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

List<String> initialMythicGMEIds = [
  for (var control in initialMythicGMEControls) control.controlId
];
