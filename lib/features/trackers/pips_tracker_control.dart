import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../data/data_structures/tracker_entry.dart';
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
    // TODO make breaking on to multiple lines more robust
    int glyphsWide = 5;

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
        widgetShowsTitle: true,
        // try 32.0 width per glyph
        maxWidth: 32.0 * glyphsWide,
        minWidth: 120.0,
        onTapLeft: () {
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
            Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: pips,
            )
          ],
        ));
  }
}
