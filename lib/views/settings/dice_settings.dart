import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../settings_view.dart';

List<Widget> diceSettings(
  AppState appState,
) {
  var general = appState.campaignData!.settings.general;
  return [
    const SettingsHeading(label: 'Dice'),
    const Text('Choose which dice you want shown'),
    SettingsOption(
      isActive: general.useFateDice,
      label: 'Use Fate Dice',
      onChanged: (isChecked) {
        appState.toggleUseFateDice();
      },
    ),
    SettingsOption(
      isActive: general.useZocchiDice,
      label: 'Use Zocchi Dice',
      onChanged: (isChecked) {
        appState.toggleUseZocchiDice();
      },
    ),
  ];
}
