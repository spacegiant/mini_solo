import 'package:flutter/cupertino.dart';

import 'dice.dart';
import 'dice_view.dart';

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
    required this.onPressed,
  });

  final DieType dieType;
  final Function(DiceRoll) onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: CupertinoColors.systemPink,
        padding: const EdgeInsets.all(0.0),
        child: Text(
          dieType.label,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        onPressed: () {
          int roll = dieType.roll();
          DiceRoll diceRoll =
              DiceRoll(dieType: dieType, value: roll, message: '');
          onPressed(diceRoll);
        });
  }
}
