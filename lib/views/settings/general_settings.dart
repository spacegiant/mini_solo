import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../settings_view.dart';

List<Widget> generalSettings(
  AppState appState,
) {
  // bool autoCopy = true;
  var general = appState.campaignData!.settings.general;
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
      isActive: general.wrapControls,
      label: 'Wrap Controls',
      onChanged: (isChecked) {
        appState.toggleWrapControls();
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
  ];
}
