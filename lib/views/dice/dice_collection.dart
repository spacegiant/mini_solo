import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
    required this.diceSet,
    required this.onPressed,
    // required this.onSubmit,
    // required this.onClear,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(List<DiceRoll>) onPressed;
  // final void Function() onSubmit;
  // final void Function() onClear;
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

    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        ...diceButtons,
        // SubmitButton(onSubmit: onSubmit),
        // ClearButton(onClear: onClear),
      ],
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onClear,
  });

  final void Function() onClear;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
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
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onSubmit,
  });

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
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
    );
  }
}
