import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';

import '../../data/app_state.dart';
import '../../data/journal_entry_types.dart';
import '../settings_view.dart';

List<Widget> generalSettings(
  AppState appState,
) {
  // bool autoCopy = true;
  var general = appState.campaignData!.settings.general;

  List<Widget> journalEntryVisibilityOptions = [];

  journalEntryTypeLabel.forEach((type, entry) {
    journalEntryVisibilityOptions.add(
      SettingsOption(
        isActive: general.hiddenEntryTypes.contains(type),
        label: entry.label,
        onChanged: (isChecked) {
          // TODO: Toggle settings for specific item
          appState.toggleJournalEntryTypeVisibility(type);
        },
      ),
    );
  });

  return [
    const SettingsHeading(label: 'General settings'),
    SettingsOption(
      isActive: general.showFutureSettings,
      label: 'Show future features',
      onChanged: (isChecked) {
        appState.toggleShowFutureFeatures();
      },
    ),
    SettingsOption(
      isActive: general.showMechanics,
      label: 'Show mechanics?',
      onChanged: (isChecked) {
        appState.toggleShowMechanics();
      },
    ),
    SettingsOption(
      isActive: general.wrapDiceControls,
      label: 'Wrap Dice Controls',
      onChanged: (isChecked) {
        appState.toggleWrapDiceControls(isChecked!);
      },
    ),
    // SettingsOption(
    //   isActive: autoCopy,
    //   label: 'Copy to clipboard automatically',
    //   onChanged: (isChecked) {
    //     setState(() {
    //       autoCopy = isChecked!;
    //     });
    //   },
    // ),
    SettingsOption(
      isActive: true,
      label: 'Send to journal',
      onChanged: (isChecked) {},
    ),
    const Text('Journal - check entry types to hide'),
    Container(
      color: CupertinoColors.systemGrey5,
      height: 200.0,
      width: 400.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: journalEntryVisibilityOptions,
        ),
      ),
    )
  ];
}
