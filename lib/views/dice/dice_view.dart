import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice/regular_dice_set.dart';
import 'package:mini_solo/views/dice/zocchi_dice_set.dart';
import 'package:mini_solo/widgets/output.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../../widgets/gap.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceView extends StatefulWidget {
  const DiceView({super.key});

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  void setOutputText(int value) {
    print('output');
    setState(() {
      outputText = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
      children: [
        Output(line1: outputText),
        DiceCollection(
          diceSet: regularDice,
          onPressed: (value) {
            setOutputText(value);
          },
        ),
        const Gap(),
        DiceCollection(
          diceSet: zocchiDice,
          onPressed: (value) {
            setOutputText(value);
          },
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
    required this.onPressed,
  });

  final DiceSet diceSet;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    Iterable diceButtons = diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
          onPressed: onPressed,
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
            children: [
              ...diceButtons,
              CupertinoButton(
                color: CupertinoColors.black,
                padding: const EdgeInsets.all(0.0),
                child: const Text(
                  '>',
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
                onPressed: () {
                  setState() {}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
