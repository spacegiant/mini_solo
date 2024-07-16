import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
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
  List<DiceRoll> diceResults = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      // bool showFutureFeatures =
      //     appState.campaignData!.settings.general.showFutureSettings;

      GeneralSettingsData generalSettings =
          appState.campaignData!.settings.general;

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
            if (constraints.maxWidth > 500) {
              return twoColumnLayout(
                constraints,
                appState,
                addResult,
                submitResults,
                clearResults,
                context,
              );
            } else {
              return singleColumnLayout(
                constraints,
                appState,
                addResult,
                submitResults,
                clearResults,
                context,
              );
            }
          },
        ),
      );
    });
  }

  Widget singleColumnLayout(
    BoxConstraints constraints,
    AppState appState,
    void Function(List<DiceRoll> result) addResult,
    void Function() submitResults,
    void Function() clearResults,
    BuildContext context,
  ) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Journal(
            constraints: constraints,
            items: appState.campaignData!.journal,
            diceRoll: diceResults,
            addDice: addResult,
            submitDice: submitResults,
            clearDice: clearResults,
          ),
        ),
        Expanded(
          flex: 6,
          child: journalControls(
            appState,
            addResult,
            context,
          ),
        ),
      ],
    );
  }

  Widget twoColumnLayout(
    BoxConstraints constraints,
    AppState appState,
    void Function(List<DiceRoll> result) addResult,
    void Function() submitResults,
    void Function() clearResults,
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            color: CupertinoColors.systemPink,
            // TODO: Better way to force height?
            // height: forceHeight,
            child: Journal(
              constraints: constraints,
              items: appState.campaignData!.journal,
              diceRoll: diceResults,
              addDice: addResult,
              submitDice: submitResults,
              clearDice: clearResults,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: kForceColumnHeight,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(
                color: CupertinoColors.inactiveGray,
                width: 3.0,
              ),
            )),
            child: journalControls(
              appState,
              addResult,
              context,
            ),
          ),
        ),
      ],
    );
  }
}
