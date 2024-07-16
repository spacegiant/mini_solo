import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';
import 'package:mini_solo/features/trackers/tracker_options.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../svg_icon.dart';

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
        .firstWhere((tracker) => tracker.type == entry.controlType)
        .label;

    int step = 12;

    switch (entry.controlType) {
      case ControlTypeEnum.ironsworn2Dangerous:
        step = 8;
        break;
      case ControlTypeEnum.ironsworn3Formidable:
        step = 4;
        break;
      case ControlTypeEnum.ironsworn4Extreme:
        step = 2;
        break;
      case ControlTypeEnum.ironsworn5Epic:
        step = 1;
        break;
      default:
        break;
    }

    int count = 0;

    List<int> ironswornTrackIndex = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    List<Widget> ironswornTrack = [];

    int numberOfFullBoxes = (entry.currentValue / 4).floor();

    for (int i = 0; i < numberOfFullBoxes; i++) {
      ironswornTrackIndex[i] = 4;
    }

    count = numberOfFullBoxes;

    int remainder = entry.currentValue - (numberOfFullBoxes * 4);

    if (count < 10) ironswornTrackIndex[count] = remainder;

    for (var index in ironswornTrackIndex) {
      SVGIcon icon = SVGIcon.ironsworn_tick_0;

      switch (index) {
        case 1:
          icon = SVGIcon.ironsworn_tick_1;
          break;
        case 2:
          icon = SVGIcon.ironsworn_tick_2;
          break;
        case 3:
          icon = SVGIcon.ironsworn_tick_3;
          break;
        case 4:
          icon = SVGIcon.ironsworn_tick_4;
          break;
      }

      ironswornTrack.add(
        Flexible(
          child: SvgIcon(
            icon: icon,
          ),
        ),
      );
    }

    void handleTap({int modifier = 1}) {
      if (entry.currentValue <= 40 && entry.currentValue >= 0) {
        int newValue = entry.currentValue + (step * modifier);
        if (newValue > 40) newValue = 40;
        if (newValue < 0) newValue = 0;

        appState.updateTrackerEntry(
          id: entry.id,
          label: entry.label,
          currentValue: newValue,
        );
      }
    }

    return TrackerContainer(
      widgetShowsTitle: true,
      maxWidth: 320.0,
      appState: appState,
      onTapLeft: () {
        handleTap(modifier: -1);
      },
      onTapRight: () {
        handleTap();
      },
      id: entry.id,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.label,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: ironswornTrack,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ironswornTrackTypeLabel.toUpperCase(),
              style: const TextStyle(
                  color: CupertinoColors.activeBlue, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
