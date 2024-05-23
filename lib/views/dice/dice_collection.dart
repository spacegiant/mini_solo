import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceCollection {
  const DiceCollection({
    required this.diceSet,
    required this.onPressed,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(List<DiceRoll>) onPressed;
  final AppState appState;

  Iterable<DiceButton> getDice() {
    return diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
          onPressed: onPressed,
          color: dieType.isZocchi == true
              ? CupertinoColors.systemBlue
              : CupertinoColors.systemPink,
        ));
  }
}
