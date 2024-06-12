import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../icons.dart';

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
