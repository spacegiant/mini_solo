import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../settings_view.dart';

List<Widget> devSettings(AppState appState) => [
      const SettingsHeading(label: 'Dev settings'),
      DestructiveDeleteCurrentCampaign(
        appState: appState,
      ),
    ];
