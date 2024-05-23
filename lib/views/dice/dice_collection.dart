import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
    required this.diceSet,
    required this.onPressed,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(List<DiceRoll>) onPressed;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    Iterable diceButtons = diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
          onPressed: onPressed,
          color: dieType.isZocchi == true
              ? CupertinoColors.systemBlue
              : CupertinoColors.systemPink,
        ));

    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        ...diceButtons,
      ],
    );
  }
}
