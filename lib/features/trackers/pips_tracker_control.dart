import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../svg_icon.dart';
import '../../widgets/gap.dart';

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
    double iconHeight = 24.0;
    List<SvgIcon> pips = [];

    for (int i = 1; i < entry.maxValue! + 1; i++) {
      if (i <= entry.currentValue) {
        pips.add(
          SvgIcon(icon: SVGIcon.pip_checked, height: iconHeight),
        );
      } else {
        pips.add(SvgIcon(icon: SVGIcon.pip_unchecked, height: iconHeight));
      }
    }

    void handleTap({int modifier = 1}) {
      appState.updateTrackerEntry(
        id: entry.id,
        currentValue: entry.currentValue + modifier,
        maxValue: entry.maxValue,
      );
    }

    return TrackerContainer(
        onTap: () {
          handleTap(modifier: -1);
        },
        onTapRight: () {
          handleTap();
        },
        appState: appState,
        id: entry.id,
        child: Column(
          children: [
            Text(entry.label),
            const Gap(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: pips,
            )
          ],
        ));
  }
}
