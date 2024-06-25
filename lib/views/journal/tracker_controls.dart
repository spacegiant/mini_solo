import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../features/trackers/bar_tracker_control.dart';
import '../../features/trackers/clock_tracker_control.dart';
import '../../features/trackers/counter_tracker_control.dart';
import '../../features/trackers/fate_aspect_tracker.dart';
import '../../features/trackers/ironsworn_tracker_control.dart';
import '../../features/trackers/pips_tracker_control.dart';
import '../../features/trackers/value_tracker_widget.dart';

class TrackerControls extends StatelessWidget {
  const TrackerControls({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    List<Widget> trackerWidgets = [];

    List<TrackerEntry>? trackerEntriesSorted = appState.campaignData?.tracker;

    trackerEntriesSorted?.sort(
        (a, b) => a.controlType.toString().compareTo(b.controlType.toString()));

    trackerEntriesSorted?.forEach((widget) {
      switch (widget.controlType) {
        case ControlTypeEnum.clock4:
        case ControlTypeEnum.clock6:
        case ControlTypeEnum.clock8:
          trackerWidgets.add(ClockWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.bar:
          trackerWidgets.add(BarWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.ironsworn1Troublesome:
        case ControlTypeEnum.ironsworn2Dangerous:
        case ControlTypeEnum.ironsworn3Formidable:
        case ControlTypeEnum.ironsworn4Extreme:
        case ControlTypeEnum.ironsworn5Epic:
          trackerWidgets.add(IronswornWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.pips:
          trackerWidgets.add(PipsWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.value:
          trackerWidgets.add(ValueWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.counter:
          trackerWidgets.add(CounterWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypeEnum.fate_aspect:
          trackerWidgets.add(FateWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        default:
          break;
      }
    });

    return WrapManager(
        wrapControls: appState.wrapControls, children: [...trackerWidgets]);
  }
}
