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
    return TrackerContainer(
        appState: appState,
        id: entry.id,
        child: Column(
          children: [
            Text(entry.label),
            const Gap(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgIcon(icon: SVGIcon.pip_checked, height: iconHeight),
                SvgIcon(icon: SVGIcon.pip_unchecked, height: iconHeight),
                SvgIcon(icon: SVGIcon.pip_unchecked, height: iconHeight),
              ],
            )
          ],
        ));
  }
}
