import 'package:flutter/cupertino.dart';

import 'dice.dart';
import 'dice_view.dart';

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
    required this.onPressed,
    this.color,
  });

  final DieType dieType;
  final Function(DiceResult) onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: color ?? CupertinoColors.systemPink,
        padding: const EdgeInsets.all(0.0),
        child: Text(
          dieType.label,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        onPressed: () {
          int roll = dieType.roll();
          DiceResult diceResult = DiceResult(
            result: dieType.roll(),
            diceType: dieType.label,
          );
          onPressed(diceResult);

          // onPressed(diceRoll);
        });
  }
}
