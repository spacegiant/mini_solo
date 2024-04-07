import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/views/dice/regular_dice_set.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import 'dice_collection.dart';
import 'dice_glyph.dart';
import 'other_dice.dart';

// DISPLAY OUTPUT BUBBLE
// DISPLAY DICE COLLECTIONS
class DiceView extends StatefulWidget {
  const DiceView({super.key});

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {
  List<DiceResult> diceResults = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        void addResult(DiceResult result) {
          setState(() {
            diceResults.add(result);
          });
        }

        void submitResults() {
          List<DiceResult> myDiceResults = List.from(diceResults);

          appState.addJournalEntry(JournalEntryItem(
            isFavourite: false,
            type: JournalEntryTypes.roll,
            // diceRolls: myDiceResults,
            // title: '',
            id: '',
          ));
          setState(() {
            diceResults.clear();
          });
        }

        void clearResults() {
          setState(() {
            diceResults.clear();
          });
        }

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
              onPressed: addResult,
              onSubmit: submitResults,
              onClear: clearResults,
            ),
            const Gap(),
            // TODO: FINISH FATE DICE IMPLEMENTATION
            if (appState.showFutureFeatures == true)
              DiceCollection(
                diceSet: fateDiceSet,
                appState: appState,
                onPressed: (result) {
                  setState(() {
                    diceResults.add(result);
                  });
                },
                onSubmit: submitResults,
                onClear: clearResults,
              ),
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
    this.label,
  });

  final List<DiceResult> diceResults;
  final String? label;

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
