import 'package:flutter/material.dart';

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
      isActive: general.useRegularDice,
      label: 'Use General Dice',
      onChanged: (isChecked) {
        appState.toggleUseGeneralDice();
      },
    ),
    SettingsOption(
      isActive: general.useZocchiDice,
      label: 'Use Zocchi Dice',
      onChanged: (isChecked) {
        appState.toggleUseZocchiDice();
      },
    ),
    const Divider(),
    SettingsOption(
      isActive: general.useFateDice,
      label: 'Use Fate Dice',
      onChanged: (isChecked) {
        appState.toggleUseFateDice();
      },
    ),
    SettingsOption(
      isActive: general.useCoriolisDice,
      label: 'Use Coriolis Dice',
      onChanged: (isChecked) {
        appState.toggleUseCoriolisDice();
      },
    ),
    SettingsOption(
      isActive: general.useT2KDice,
      label: 'Use Twilight 2000 Dice',
      onChanged: (isChecked) {
        appState.toggleUseT2KDice();
      },
    ),
    SettingsOption(
      isActive: general.useD6Oracle,
      label: 'Use D6 Oracle Dice',
      onChanged: (isChecked) {
        appState.toggleUseD6Oracle();
      },
    ),
  ];
}
