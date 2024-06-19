import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';

import '../../data/app_state.dart';
import '../../features/trackers/bar_tracker_control.dart';
import '../../features/trackers/clock_tracker_control.dart';
import '../../features/trackers/counter_tracker_control.dart';
import '../../features/trackers/fate_aspect_tracker.dart';
import '../../features/trackers/ironsworn_tracker_control.dart';
import '../../features/trackers/pips_tracker_control.dart';
import '../../features/trackers/value_tracker_widget.dart';
import '../../svg_icon.dart';
import '../../widgets/list_button.dart';
import '../dice/dice_button.dart';
import '../dice/other_dice_sets.dart';
import 'journal_controls.dart';

enum ControlTypeEnum {
  button,
  dice,
  diceGroup,
  // TRACKER TYPES
  clock4,
  clock6,
  clock8,
  bar,
  ironsworn1Troublesome,
  ironsworn2Dangerous,
  ironsworn3Formidable,
  ironsworn4Extreme,
  ironsworn5Epic,
  pips,
  value,
  counter,
  fate_aspect,
}

Widget chooseControlWidget({
  required ControlData controlData,
  required AppState appState,
}) {
  switch (controlData.controlType) {
    case ControlTypeEnum.button:
      return ListButton(
        label: controlData.label,
        onPressed: () {},
      );
    case ControlTypeEnum.diceGroup:
      return Text(controlData.label);
    case ControlTypeEnum.dice:
      return DiceButton(
        dieType: d6oracle,
        label: 'D6 Oracle',
        icon: SVGIcon.d6Oracle,
        onPressed: (value) {},
      );
    //   TRACKERS
    case ControlTypeEnum.clock4:
    case ControlTypeEnum.clock6:
    case ControlTypeEnum.clock8:
      return ClockWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.bar:
      return BarWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.ironsworn1Troublesome:
    case ControlTypeEnum.ironsworn2Dangerous:
    case ControlTypeEnum.ironsworn3Formidable:
    case ControlTypeEnum.ironsworn4Extreme:
    case ControlTypeEnum.ironsworn5Epic:
      return IronswornWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.pips:
      return PipsWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.value:
      return ValueWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.counter:
      return CounterWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlTypeEnum.fate_aspect:
      return FateWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
  }
  return Text(controlData.label);
}

TrackerEntry? getTrackerEntry(AppState appState) {
  return appState.campaignData?.tracker
      .firstWhere((tracker) => tracker.id == appState.currentEntryId);
}
