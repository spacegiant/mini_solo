import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import 'journal.dart';
import 'journal_controls.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  String? line1;
  String? line2;
  String? line3;
  String type = '...';
  List<DiceRoll> diceResults = [];

  void updateState(JournalReturnObject result) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      // bool showFutureFeatures =
      //     appState.campaignData!.settings.general.showFutureSettings;

      GeneralSettingsData generalSettings =
          appState.campaignData!.settings.general;

      bool wrapControls = generalSettings.wrapControls;

      void addResult(List<DiceRoll> result) {
        setState(() {
          diceResults.addAll(result);
        });
      }

      void clearResults() {
        setState(() {
          diceResults.clear();
        });
      }

      void submitResults() {
        List<DiceRoll> myDiceResults = List.from(diceResults);

        if (diceResults.isNotEmpty) {
          appState.addRollEntry(
            RollEntryItem(
              isFavourite: false,
              result: myDiceResults,
            ),
          );
          clearResults();
        }
      }

      return FocusScope(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Journal(
                  constraints: constraints,
                  items: appState.campaignData!.journal,
                  diceRoll: diceResults,
                  addDice: addResult,
                  submitDice: submitResults,
                  clearDice: clearResults,
                ),
                journalControls(appState, addResult, wrapControls, context),
              ],
            );
          },
        ),
      );
    });
  }
}
