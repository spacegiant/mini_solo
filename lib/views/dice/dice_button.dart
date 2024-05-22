import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';
import 'dice.dart';

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
    required this.onPressed,
    this.color,
    this.label,
    this.numberOfRolls = 1,
  });

  final DiceType dieType;
  final Function(List<DiceRoll>) onPressed;
  final Color? color;
  final String? label;
  final int? numberOfRolls;

  @override
  Widget build(BuildContext context) {
    String buttonLabel = label ?? dieType.label;
    List<DiceRoll> result = [];

    return CupertinoButton(
        color: color ?? CupertinoColors.systemPink,
        padding: const EdgeInsets.all(0.0),
        child: Text(
          buttonLabel,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        onPressed: () {
          for (int i = 1; i <= numberOfRolls!; i++) {
            DiceRoll diceResult = DiceRoll(
              result: dieType.roll(),
              diceType: dieType.label,
            );
            result.add(diceResult);
          }

          onPressed(result);
        });
  }
}
