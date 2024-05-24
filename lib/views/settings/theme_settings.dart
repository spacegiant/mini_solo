import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../settings_view.dart';

List<Widget> themeSettings(
  AppState appState,
) {
  var general = appState.campaignData!.settings.general;
  return [
    const SettingsHeading(label: 'Theme'),
    const Text('Light/Dark/Match OS'),
    const Text('Fantasy/Scifi/Modern Theme?')
  ];
}
