import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';

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
        minWidth: 160.0,
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
