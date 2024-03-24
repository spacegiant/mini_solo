import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice/regular_dice_set.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../../utilities/app_state.dart';
import '../../widgets/gap.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceRoll {
  DieType dieType;
  int value;
  String message;

  DiceRoll({
    required this.dieType,
    required this.value,
    required this.message,
  });
}

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
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return ViewWrapper(
          children: [
            SpeechBubble(line1: outputText),
            DiceCollection(
              diceSet:
                  appState.campaignData?.settings.general.useZocchiDice == true
                      ? all
                      : regularDice,
              appState: appState,
              onPressed: (diceRoll) {
                setOutputText(diceRoll.value);
              },
            ),
            const Gap(),
            // TODO: Add Genesys dice
            if (appState.showFutureFeatures == true) const Text('Genesys dice'),
            // TODO: Add story dice
            if (appState.showFutureFeatures == true) const Text('Story dice'),
          ],
        );
      },
    );
  }
}

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
    required this.diceSet,
    required this.onPressed,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(DiceRoll) onPressed;
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
