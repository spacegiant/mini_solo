import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/gap.dart';

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
    void handleTap({int modifier = 1}) {
      appState.updateTrackerEntry(
        id: entry.id,
        label: entry.label,
        currentValue: entry.currentValue + modifier,
      );
    }

    return Stack(children: [
      TrackerContainer(
          onTapLeft: () {
            handleTap(modifier: -1);
          },
          onTapRight: () {
            handleTap();
          },
          minWidth: 160.0,
          appState: appState,
          id: entry.id,
          widgetShowsTitle: true,
          child: Column(
            children: [
              Text(entry.label),
              const Gap(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.arrowtriangle_left_fill),
                  SizedBox(
                      width: 100.0,
                      child: Text(
                        entry.currentValue.toString(),
                        textAlign: TextAlign.center,
                      )),
                  const Icon(CupertinoIcons.arrowtriangle_right_fill),
                ],
              ),
            ],
          )),
    ]);
  }
}
