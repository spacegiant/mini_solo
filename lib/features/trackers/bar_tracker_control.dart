import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/gap.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
    required this.entry,
    required this.appState,
  });

  final TrackerEntry entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    void handleTap({int modifier = 1}) {
      if (entry.currentValue + modifier > entry.maxValue) return;
      if (entry.currentValue + modifier < entry.minValue) return;

      int newValue = entry.currentValue + modifier;

      appState.updateTrackerEntry(
        id: entry.id,
        label: entry.label,
        currentValue: newValue,
        minValue: entry.minValue,
        maxValue: entry.maxValue,
      );
    }

    double progress = entry.currentValue / entry.maxValue;

    return TrackerContainer(
        appState: appState,
        onTap: () {
          handleTap(modifier: -1);
        },
        onTapRight: () {
          handleTap();
        },
        id: entry.id,
        child: SizedBox(
          width: 180.0,
          child: Column(
            children: [
              Text(entry.label),
              const Gap(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
                // color: CupertinoColors.systemPink,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: CupertinoColors.white,
                ),
              ),
              const Gap(
                height: 8.0,
              ),
              Text(
                '${entry.currentValue}/${entry.maxValue}',
                style: TextStyle(fontSize: 11.0),
              ),
            ],
          ),
        ));
  }
}
