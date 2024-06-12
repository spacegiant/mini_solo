import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../icons.dart';

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
