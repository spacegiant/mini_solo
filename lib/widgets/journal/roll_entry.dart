import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';
import '../../views/dice/dice_view.dart';

class RollEntry extends StatelessWidget {
  const RollEntry({
    super.key,
    required this.diceResults,
  });

  final List<DiceResult> diceResults;

  @override
  Widget build(BuildContext context) {
    return DiceBubble(diceResults: diceResults);
  }
}
