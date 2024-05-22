import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';

class RollEntry extends StatelessWidget {
  const RollEntry({
    super.key,
    required this.diceResults,
  });

  final List<DiceRoll> diceResults;

  @override
  Widget build(BuildContext context) {
    // return DiceBubble(diceResults: diceResults);
    return const Text('Dice Bubble');
  }
}
