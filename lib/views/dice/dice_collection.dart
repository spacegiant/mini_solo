import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/gap.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
    required this.diceSet,
    required this.onPressed,
    required this.onSubmit,
    required this.onClear,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(DiceResult) onPressed;
  final void Function() onSubmit;
  final void Function() onClear;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    Iterable diceButtons = diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
          onPressed: onPressed,
          color: dieType.isZocchi == true
              ? CupertinoColors.systemBlue
              : CupertinoColors.systemPink,
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
                  onSubmit();
                },
              ),
              CupertinoButton(
                color: CupertinoColors.black,
                padding: const EdgeInsets.all(0.0),
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
                onPressed: () {
                  onClear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
