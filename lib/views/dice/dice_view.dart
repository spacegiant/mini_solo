import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/views/dice/regular_dice_set.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../../utilities/app_state.dart';
import '../../widgets/gap.dart';
import 'dice_collection.dart';
import 'dice_glyph.dart';

// DISPLAY OUTPUT BUBBLE
// DISPLAY DICE COLLECTIONS
class DiceView extends StatefulWidget {
  const DiceView({super.key});

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {
  List<DiceResult> diceResults = [
    DiceResult(result: 6, diceType: 'd12'),
    DiceResult(result: 4, diceType: 'd6'),
    DiceResult(result: 74, diceType: 'd100'),
  ];

  void setOutputText(DiceResult result) {
    print('output');
    setState(() {
      // outputText = value.toString();
      diceResults.add(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return ViewWrapper(
          children: [
            SpeechBubble(
              widget: DiceBubble(
                diceResults: diceResults,
              ),
            ),
            DiceCollection(
              diceSet:
                  appState.campaignData?.settings.general.useZocchiDice == true
                      ? all
                      : regularDice,
              appState: appState,
              onPressed: (diceResult) {
                // TODO: UPDATE OUTPUT

                diceResults.add(diceResult);

                // TODO: PUSH TO JOURNAL
              },
            ),
            const Gap(),
            // TODO: Add Genesys dice
            if (appState.showFutureFeatures == true) const Text('Genesys dice'),
            // TODO: Add story dice
            if (appState.showFutureFeatures == true) const Text('Story dice'),
            //   TODO: Add preset dice rolls e.g. Ironsworn, Fate
          ],
        );
      },
    );
  }
}

// TODO: MOVE TO OWN FILE WHEN FINISHED
class DiceBubble extends StatelessWidget {
  const DiceBubble({
    super.key,
    required this.diceResults,
  });

  final List<DiceResult> diceResults;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Wrap(
              children: [
                ...diceResults.map(
                  (e) => DiceGlyph(
                    rolledValue: e.result,
                    dieType: e.diceType,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class DiceResult {
  int result;
  String diceType;
  Color? color;

  DiceResult({
    required this.result,
    required this.diceType,
    this.color,
  });
}
