import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/svg_icon.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../features/trackers/bar_tracker_control.dart';
import '../../features/trackers/clock_tracker_control.dart';
import '../../features/trackers/counter_tracker_control.dart';
import '../../features/trackers/fate_aspect_tracker.dart';
import '../../features/trackers/ironsworn_tracker_control.dart';
import '../../features/trackers/pips_tracker_control.dart';
import '../../features/trackers/tracker_container.dart';
import '../../features/trackers/tracker_options.dart';
import '../../features/trackers/value_tracker_widget.dart';
import '../../widgets/gap.dart';

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
        case ControlTypes.clock4:
        case ControlTypes.clock6:
        case ControlTypes.clock8:
          trackerWidgets.add(ClockWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.bar:
          trackerWidgets.add(BarWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.ironsworn1Troublesome:
        case ControlTypes.ironsworn2Dangerous:
        case ControlTypes.ironsworn3Formidable:
        case ControlTypes.ironsworn4Extreme:
        case ControlTypes.ironsworn5Epic:
          trackerWidgets.add(IronswornWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.pips:
          trackerWidgets.add(PipsWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.value:
          trackerWidgets.add(ValueWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.counter:
          trackerWidgets.add(CounterWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case ControlTypes.fate_aspect:
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
