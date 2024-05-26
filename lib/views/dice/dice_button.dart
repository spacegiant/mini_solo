import 'package:flutter/cupertino.dart';
import 'package:mini_solo/icons.dart';

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
    this.icon,
  });

  final DiceType dieType;
  final Function(List<DiceRoll>) onPressed;
  final Color? color;
  final String? label;
  final int? numberOfRolls;
  final Images? icon;

  @override
  Widget build(BuildContext context) {
    String buttonLabel = label ?? dieType.label;
    List<DiceRoll> result = [];

    Widget iconButton = CupertinoButton(
        padding: const EdgeInsets.all(0.0),
        child: SvgIcon(icon: icon),
        onPressed: () {
          for (int i = 1; i <= numberOfRolls!; i++) {
            BothResults roll = dieType.roll();
            DiceRoll diceResult = DiceRoll(
              result: roll,
              diceType: dieType.label,
              icon: dieType.faces[roll.rolledValue].icon,
            );
            result.add(diceResult);
          }
          onPressed(result);
        });

    Widget textButton = CupertinoButton(
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
              icon: icon,
            );
            result.add(diceResult);
          }

          onPressed(result);
        });
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: icon != null ? iconButton : textButton,
    );
  }
}
