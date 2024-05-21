import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';
import 'dice.dart';

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
    required this.onPressed,
    this.color,
  });

  final DiceType dieType;
  final Function(DiceRoll) onPressed;
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
          dieType.roll();
          DiceRoll diceResult = DiceRoll(
            result: dieType.roll(),
            diceType: dieType.label,
            // isFavourite: false,
          );
          onPressed(diceResult);
        });
  }
}
