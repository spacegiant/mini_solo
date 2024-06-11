import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

class TrackerControls extends StatelessWidget {
  const TrackerControls({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    List<Widget> trackerWidgets = [];
    appState.campaignData?.tracker.forEach((widget) {
      switch (widget.trackerType) {
        case TrackerTypes.clock:
          trackerWidgets.add(ClockWidget(entry: widget));
          break;
        case TrackerTypes.bar:
          trackerWidgets.add(BarWidget(entry: widget));
          break;
        case TrackerTypes.ironswornTrack:
          trackerWidgets.add(IronswornWidget(entry: widget));
          break;
        case TrackerTypes.pips:
          trackerWidgets.add(PipsWidget(entry: widget));
          break;
        case TrackerTypes.value:
          trackerWidgets.add(ValueWidget(entry: widget));
          break;
        case TrackerTypes.counter:
          trackerWidgets.add(CounterWidget(entry: widget));
          break;
        default:
          break;
      }
    });
    return WrapManager(wrapControls: true, children: [
      ListButton(
        label: 'New Tracker',
        onPressed: () {
          // TODO: Open Create Tracker Popup
          appState.toggleShowPopup(
            label: PopupLabel.manageTracker,
          );
        },
      ),
      if (trackerWidgets != null) ...trackerWidgets
    ]);
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}

class PipsWidget extends StatelessWidget {
  const PipsWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}

class IronswornWidget extends StatelessWidget {
  const IronswornWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    required this.entry,
  });

  final TrackerEntry entry;

  @override
  Widget build(BuildContext context) {
    return Text(entry.label);
  }
}
