import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../icons.dart';
import '../../widgets/wrap_manager.dart';
import '../dice/dice.dart';
import '../dice/dice_button.dart';
import '../dice/dice_collection.dart';
import '../dice/fate_dice.dart';
import '../dice/other_dice_sets.dart';
import '../dice/regular_dice_set.dart';

WrapManager diceTray(
  AppState appState,
  void Function(List<DiceRoll> result) addResult,
) {
  GeneralSettingsData generalSettings = appState.campaignData!.settings.general;
  bool useZocchiDice = generalSettings.useZocchiDice;
  bool useRegularDice = generalSettings.useRegularDice;
  bool useGeneralDice = useZocchiDice && useRegularDice;
  bool useFateDice = generalSettings.useFateDice;
  bool useCoriolisDice = generalSettings.useCoriolisDice;
  bool useD6OracleDice = generalSettings.useD6Oracle;

  bool wrapControls = generalSettings.wrapControls;

  DiceSet? generalDiceSubset;

  if (useGeneralDice) {
    generalDiceSubset = all;
  } else if (useZocchiDice) {
    generalDiceSubset = zocchiDice;
  } else if (useRegularDice) {
    generalDiceSubset = regularDice;
  }

  DiceCollection? generalDice = generalDiceSubset != null
      ? DiceCollection(
          diceSet: generalDiceSubset,
          appState: appState,
          onPressed: addResult,
        )
      : null;

  return WrapManager(
    wrapControls: wrapControls,
    // hideDivider: true,
    children: [
      if (useD6OracleDice)
        DiceButton(
          dieType: d6oracle,
          label: 'D6 Oracle',
          icon: SVGIcon.d6Oracle,
          onPressed: addResult,
        ),
      if (useFateDice) ...[
        DiceButton(
          color: CupertinoColors.systemOrange,
          dieType: fate,
          numberOfRolls: 4,
          label: '4dF',
          onPressed: addResult,
          icon: SVGIcon.fateDice,
        ),
      ],
      if (useCoriolisDice)
        DiceButton(
          dieType: coriolis,
          label: 'Coriolis',
          icon: SVGIcon.coriolis6,
          onPressed: addResult,
        ),
      if (generalDice != null) ...generalDice.getDice(),
    ],
  );
}
