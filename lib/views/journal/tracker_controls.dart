import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

    List<TrackerEntry>? trackerEntriesSorted = appState.campaignData?.tracker;

    trackerEntriesSorted?.sort(
        (a, b) => a.trackerType.toString().compareTo(b.trackerType.toString()));

    trackerEntriesSorted?.forEach((widget) {
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
    return TrackerContainer(
        child: Column(
      children: [
        Text(entry.label),
        Text(entry.currentValue.toString()),
      ],
    ));
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
    return TrackerContainer(
        minWidth: 60.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              entry.currentValue.toString(),
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            Text(entry.label),
          ],
        ));
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
    return TrackerContainer(
        child: Column(
      children: [
        Text(entry.label),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(
              icon: SVGIcon.pip_checked,
              height: 36.0,
              width: 24.0,
            ),
            SvgIcon(icon: SVGIcon.pip_unchecked, height: 36.0),
            SvgIcon(icon: SVGIcon.pip_unchecked, height: 36.0),
          ],
        )
      ],
    ));
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
    return TrackerContainer(
      maxWidth: 320.0,
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entry.label,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
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
    return TrackerContainer(
        child: SizedBox(
      width: 180.0,
      child: Column(
        children: [
          Text(entry.label),
          const Gap(
            height: 8.0,
          ),
          Container(
            height: 10.0,
            // color: CupertinoColors.systemPink,
            child: const LinearProgressIndicator(
              value: 0.3,
              backgroundColor: CupertinoColors.white,
            ),
          ),
          const Gap(),
        ],
      ),
    ));
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
      child: TrackerContainer(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 180.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon(icon: iconList[1]),
              Flexible(
                  child: Text(
                entry.label,
                style: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackerContainer extends StatelessWidget {
  const TrackerContainer({
    super.key,
    required this.child,
    this.minWidth = 100.0,
    this.maxWidth,
  });

  final Widget child;
  final double minWidth;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    double myDouble = maxWidth ?? double.infinity;
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: myDouble,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: const BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: child,
    );
  }
}
