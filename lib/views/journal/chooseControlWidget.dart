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

enum ControlType {
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
    case ControlType.button:
      return ListButton(
        label: controlData.label,
        onPressed: () {},
      );
    case ControlType.diceGroup:
      return Text(controlData.label);
    case ControlType.dice:
      return DiceButton(
        dieType: d6oracle,
        label: 'D6 Oracle',
        icon: SVGIcon.d6Oracle,
        onPressed: (value) {},
      );
    //   TRACKERS
    case ControlType.clock4:
    case ControlType.clock6:
    case ControlType.clock8:
      return ClockWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.bar:
      return BarWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.ironsworn1Troublesome:
    case ControlType.ironsworn2Dangerous:
    case ControlType.ironsworn3Formidable:
    case ControlType.ironsworn4Extreme:
    case ControlType.ironsworn5Epic:
      return IronswornWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.pips:
      return PipsWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.value:
      return ValueWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.counter:
      return CounterWidget(
        entry: getTrackerEntry(appState)!,
        appState: appState,
      );
    case ControlType.fate_aspect:
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
