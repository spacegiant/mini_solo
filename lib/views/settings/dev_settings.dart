import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../settings_view.dart';

List<Widget> devSettings(AppState appState) => [
      const SettingsHeading(label: 'Dev settings'),
      DestructiveDeleteCurrentCampaign(
        appState: appState,
      ),
      DestructiveDeleteRandomTables(appState: appState),
      DestructiveClearJournal(
        appState: appState,
      )
    ];

class DestructiveDeleteCurrentCampaign extends StatelessWidget {
  const DestructiveDeleteCurrentCampaign({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          String? campaignFilename = appState.campaignData?.filename;
          appState.deleteCampaign(campaignFilename);
        },
        child: Container(
            color: CupertinoColors.destructiveRed,
            padding: const EdgeInsets.all(10.0),
            child: const Text('Hold to delete current campaign')),
      ),
    );
  }
}

class DestructiveDeleteRandomTables extends StatelessWidget {
  const DestructiveDeleteRandomTables({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          appState.appSettingsData.randomTables = [];
          appState.saveAppSettingsDataToDisk();
        },
        child: Container(
            color: CupertinoColors.destructiveRed,
            padding: const EdgeInsets.all(10.0),
            child: const Text('Hold to delete random tables')),
      ),
    );
  }
}

class DestructiveClearJournal extends StatelessWidget {
  const DestructiveClearJournal({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          appState.campaignData?.journal = [];
          appState.saveAppSettingsDataToDisk();
        },
        child: Container(
            color: CupertinoColors.destructiveRed,
            padding: const EdgeInsets.all(10.0),
            child: const Text('Hold to clear jouranl')),
      ),
    );
  }
}
