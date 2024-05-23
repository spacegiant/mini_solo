
import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';

class DiceGlyph extends StatelessWidget {
  const DiceGlyph({
    super.key,
    required this.diceRoll,
    required this.dieType,
  });

  final DiceRoll diceRoll;
  final String dieType;

  @override
  Widget build(BuildContext context) {
    double circleWidth = 50.0;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: circleWidth,
          width: circleWidth,
          clipBehavior: Clip.none,
          decoration: const BoxDecoration(
            color: CupertinoColors.systemYellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(diceRoll.result.label!),
                Text(
                  dieType,
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
