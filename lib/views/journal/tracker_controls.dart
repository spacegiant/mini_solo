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
        (a, b) => a.trackerType.toString().compareTo(b.trackerType.toString()));

    trackerEntriesSorted?.forEach((widget) {
      switch (widget.trackerType) {
        case TrackerTypes.clock4:
        case TrackerTypes.clock6:
        case TrackerTypes.clock8:
          trackerWidgets.add(ClockWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case TrackerTypes.bar:
          trackerWidgets.add(BarWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case TrackerTypes.ironsworn1Troublesome:
        case TrackerTypes.ironsworn2Dangerous:
        case TrackerTypes.ironsworn3Formidable:
        case TrackerTypes.ironsworn4Extreme:
        case TrackerTypes.ironsworn5Epic:
          trackerWidgets.add(IronswornWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case TrackerTypes.pips:
          trackerWidgets.add(PipsWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case TrackerTypes.value:
          trackerWidgets.add(ValueWidget(
            entry: widget,
            appState: appState,
          ));
          break;
        case TrackerTypes.counter:
          trackerWidgets.add(CounterWidget(
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
