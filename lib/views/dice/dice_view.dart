import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice/regular_dice_set.dart';
import 'package:mini_solo/views/dice/zocchi_dice_set.dart';
import 'package:mini_solo/widgets/output.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../../widgets/gap.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
      children: [
        const Output(line1: '...'),
        DiceCollection(
          diceSet: regularDice,
        ),
        const Gap(),
        DiceCollection(
          diceSet: zocchiDice,
        ),
        const Gap(),
        const Text('Genesys dice'),
        const Text('Story dice'),
      ],
    );
  }
}

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
    required this.diceSet,
  });

  final DiceSet diceSet;

  @override
  Widget build(BuildContext context) {
    Iterable diceButtons = diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
        ));

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3.0,
            color: CupertinoColors.systemRed,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          Text(diceSet.label),
          const Gap(),
          Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [...diceButtons],
          ),
        ],
      ),
    );
  }
}
