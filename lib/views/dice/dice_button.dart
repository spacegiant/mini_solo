import 'package:flutter/cupertino.dart';

import 'dice.dart';

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
  });

  final DieType dieType;

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
          print(roll);
        });
  }
}
