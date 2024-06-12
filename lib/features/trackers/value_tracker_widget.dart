import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';

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
