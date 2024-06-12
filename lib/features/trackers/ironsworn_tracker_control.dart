import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';
import 'package:mini_solo/features/trackers/tracker_options.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../icons.dart';

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

    int step = 12;

    switch (entry.trackerType) {
      case TrackerTypes.ironsworn2Dangerous:
        step = 8;
        break;
      case TrackerTypes.ironsworn3Formidable:
        step = 4;
        break;
      case TrackerTypes.ironsworn4Extreme:
        step = 2;
        break;
      case TrackerTypes.ironsworn5Epic:
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

    ironswornTrackIndex[count] = remainder;

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

    return TrackerContainer(
      maxWidth: 320.0,
      appState: appState,
      id: entry.id,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  entry.label,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              Text(ironswornTrackTypeLabel),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: ironswornTrack,
          ),
        ],
      ),
    );
  }
}
