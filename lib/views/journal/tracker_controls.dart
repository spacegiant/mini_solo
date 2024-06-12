import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/icons.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../features/trackers/tracker_options.dart';
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

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.entry,
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return TrackerContainer(
        appState: appState,
        id: entry.id,
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
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return TrackerContainer(
        appState: appState,
        id: entry.id,
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
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return TrackerContainer(
        appState: appState,
        id: entry.id,
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
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    String ironswornTrackTypeLabel = trackers
        .firstWhere((tracker) => tracker.type == entry.trackerType)
        .label;
    return TrackerContainer(
      maxWidth: 320.0,
      appState: appState,
      id: entry.id,
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  entry.label,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              Text(ironswornTrackTypeLabel),
              Text(entry.currentValue.toString())
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
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    double progress = entry.currentValue / entry.maxValue;

    return TrackerContainer(
        appState: appState,
        id: entry.id,
        child: SizedBox(
          width: 180.0,
          child: Column(
            children: [
              Text(entry.label),
              const Gap(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
                // color: CupertinoColors.systemPink,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: CupertinoColors.white,
                ),
              ),
              const Gap(
                height: 8.0,
              ),
              Text(
                '${entry.currentValue}/${entry.maxValue}',
                style: TextStyle(fontSize: 11.0),
              ),
            ],
          ),
        ));
  }
}

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    required this.entry,
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

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

    if (entry.trackerType == TrackerTypes.clock6) {
      iconList = sixSegment;
    } else if (entry.trackerType == TrackerTypes.clock8) {
      iconList = eightSegment;
    }

    return TrackerContainer(
      appState: appState,
      id: entry.id,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 180.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(icon: iconList[entry.currentValue]),
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
    );
  }
}

class TrackerContainer extends StatelessWidget {
  const TrackerContainer({
    super.key,
    required this.child,
    this.minWidth = 100.0,
    this.maxWidth,
    required this.appState,
    required this.id,
  });

  final Widget child;
  final double minWidth;
  final double? maxWidth;
  final AppState appState;
  final String id;

  @override
  Widget build(BuildContext context) {
    double myDouble = maxWidth ?? double.infinity;
    return GestureDetector(
      onTap: () {},
      onLongPress: () {
        appState.setCurrentEntryId(id);
        appState.toggleShowPopup(label: PopupLabel.editTracker);
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: myDouble,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: const BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: child,
      ),
    );
  }
}
