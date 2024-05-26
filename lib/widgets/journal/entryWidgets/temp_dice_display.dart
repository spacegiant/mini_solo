import 'package:flutter/cupertino.dart';

import '../../../views/dice/dice_glyph.dart';
import '../journal.dart';

class TempDiceDisplay extends StatelessWidget {
  const TempDiceDisplay({
    super.key,
    required this.widget,
  });

  final Journal widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.submitDice();
      },
      onLongPress: () {
        widget.clearDice();
      },
      child: Container(
        color: CupertinoColors.lightBackgroundGray,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  ...widget.diceRoll!.map<Widget>(
                    (roll) => DiceGlyph(
                      diceRoll: roll,
                      dieType: roll.diceType,
                    ),
                  ),
                ],
              ),
              const Center(
                  child: Text(
                'Press to submit, Long Hold to clear',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
