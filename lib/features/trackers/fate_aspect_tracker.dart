import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/trackers/tracker_container.dart';
import 'package:mini_solo/svg_icon.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/gap.dart';

class FateWidget extends StatelessWidget {
  const FateWidget({
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
          onTap: () {
            if (entry.currentValue <= 0) return;
            handleTap(modifier: -1);
          },
          onTapRight: () {
            handleTap();
          },
          minWidth: 160.0,
          maxWidth: 220.0,
          appState: appState,
          id: entry.id,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\'${entry.label}\''),
              const Gap(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SvgIcon(
                    icon: SVGIcon.fateDice,
                    height: 20.0,
                  ),
                  Text(
                    'Free invokes: ${entry.currentValue.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          )),
    ]);
  }
}
