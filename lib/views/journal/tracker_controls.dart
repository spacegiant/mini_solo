import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/icons.dart';
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
    return WrapManager(
        wrapControls: true,
        children: [if (trackerWidgets != null) ...trackerWidgets]);
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
    List<Images> fourSegment = [
      Images.clock4_0,
      Images.clock4_1,
      Images.clock4_2,
      Images.clock4_3,
      Images.clock4_4,
    ];

    List<Images> sixSegment = [
      Images.clock6_0,
      Images.clock6_1,
      Images.clock6_2,
      Images.clock6_3,
      Images.clock6_4,
      Images.clock6_5,
      Images.clock6_6,
    ];

    List<Images> eightSegment = [
      Images.clock8_0,
      Images.clock8_1,
      Images.clock8_2,
      Images.clock8_3,
      Images.clock8_4,
      Images.clock8_5,
      Images.clock8_6,
      Images.clock8_7,
      Images.clock8_8,
    ];

    return Column(
      children: [
        Text(entry.label),
        const SvgIcon(icon: Images.clock4_0),
      ],
    );
  }
}
