import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/icons.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

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
        wrapControls: appState.wrapControls, children: [...trackerWidgets]);
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(entry.label),
              Gap(),
              if (entry.subtype != null) Text(entry.subtype!),
            ],
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
              Flexible(
                child: SvgIcon(
                  icon: SVGIcon.ironsworn_tick_4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
    List<SVGIcon> fourSegment = [
      SVGIcon.clock4_0,
      SVGIcon.clock4_1,
      SVGIcon.clock4_2,
      SVGIcon.clock4_3,
      SVGIcon.clock4_4,
    ];

    List<SVGIcon> sixSegment = [
      SVGIcon.clock6_0,
      SVGIcon.clock6_1,
      SVGIcon.clock6_2,
      SVGIcon.clock6_3,
      SVGIcon.clock6_4,
      SVGIcon.clock6_5,
      SVGIcon.clock6_6,
    ];

    List<SVGIcon> eightSegment = [
      SVGIcon.clock8_0,
      SVGIcon.clock8_1,
      SVGIcon.clock8_2,
      SVGIcon.clock8_3,
      SVGIcon.clock8_4,
      SVGIcon.clock8_5,
      SVGIcon.clock8_6,
      SVGIcon.clock8_7,
      SVGIcon.clock8_8,
    ];

    var iconList = fourSegment;

    if (entry.subtype == '6segment') {
      iconList = sixSegment;
    } else if (entry.subtype == '8segment') {
      iconList = eightSegment;
    }

    return GestureDetector(
      onTap: () {},
      onLongPress: () {},
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(icon: iconList[1]),
            Text(entry.label),
          ],
        ),
      ),
    );
  }
}
