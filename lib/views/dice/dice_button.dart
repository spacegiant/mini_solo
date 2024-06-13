import 'package:flutter/cupertino.dart';
import 'package:mini_solo/svg_icon.dart';

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
    required this.icon,
  });

  final DiceType dieType;
  final Function(List<DiceRoll>) onPressed;
  final Color? color;
  final String? label;
  final int? numberOfRolls;
  final SVGIcon icon;

  @override
  Widget build(BuildContext context) {
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
              icon: dieType.faces[roll.rolledValue - 1].icon,
            );
            result.add(diceResult);
          }
          onPressed(result);
        });

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      // child: icon != null ? iconButton : textButton,
      child: iconButton,
    );
  }
}
