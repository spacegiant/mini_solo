import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice/dice_button.dart';
import 'package:mini_solo/views/dice/fate_dice.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';
import 'package:provider/provider.dart';

import '../data/app_state.dart';
import '../data/campaign_data.dart';
import '../utilities/get_random_result.dart';
import '../utilities/get_weighted_result.dart';
import '../utilities/test_scene.dart';
import '../widgets/gap.dart';
import '../widgets/journal/journal.dart';
import 'dice/dice_collection.dart';
import 'dice/regular_dice_set.dart';
import 'mythic/fate_question.dart';

enum SceneState {
  expected,
  altered,
  interrupt,
}

Map<SceneState, String> sceneLabels = {
  SceneState.expected: 'Expected Scene',
  SceneState.altered: 'Altered Scene',
  SceneState.interrupt: 'Interrupt Scene'
};

class SceneStateResult {
  final String outcome = '';
  final String info = '';

  SceneStateResult(
    String outcome,
    String info,
  ) {
    outcome = this.outcome;
    info = this.info;
  }
}

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

  void updateState(ReturnObject result) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
    });
  }

  getEventFocus(AppState appState) {
    getWeightedResult('lib/assets/json/mythic.json', (String text) {
      setState(() {
        line1 = text;
        line2 = null;
        line3 = null;
      });

      //  Save to campaign data and push to journal
      appState.addMythicEntry(
        MythicEntry(
          isFavourite: false,
          lines: ReturnObject(
            result: text,
            type: 'mythic',
          ),
          label: 'Mythic Event Focus',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      bool showFutureFeatures =
          appState.campaignData!.settings.general.showFutureSettings;

      bool wrapControls = appState.campaignData!.settings.general.wrapControls;

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
          appState.addRoll(
            RollEntryItem(isFavourite: false, result: myDiceResults),
          );
          clearResults();
        }
      }

      DiceCollection generalDice = DiceCollection(
        diceSet: appState.campaignData?.settings.general.useZocchiDice == true
            ? all
            : regularDice,
        appState: appState,
        onPressed: addResult,
      );

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          appState.useJournal
              // ADD TEMP DICE ROLL ENTRY HERE
              ? Journal(
                  items: appState.campaignData!.journal,
                  diceRoll: diceResults,
                  addDice: addResult,
                  submitDice: submitResults,
                  clearDice: clearResults,
                )
              : const SizedBox.shrink(),
          Expanded(
            flex: 1,
            child: ViewWrapper(children: [
              const Gap(),

              WrapManager(
                wrapControls: wrapControls,
                hideDivider: true,
                children: [
                  if (appState.campaignData!.settings.general.useFateDice)
                    DiceButton(
                        color: CupertinoColors.systemOrange,
                        dieType: fate,
                        numberOfRolls: 4,
                        label: '4dF',
                        onPressed: (List<DiceRoll> result) {
                          setState(() {
                            diceResults.addAll(result);
                          });
                          // send the array to the temp dice roll
                        }),
                  const Gap(),
                  ...generalDice.getDice(),
                ],
              ),
              const Divider(),

              const Text('Mythic GME'),

              FateQuestion(
                callback: (ReturnObject returnObject) {
                  // For Bubble
                  setState(() {
                    line1 = returnObject.line1!;
                    line2 = returnObject.line2;
                    line3 = returnObject.result;
                  });

                  appState.addOracleEntry(
                    OracleEntry(
                        isFavourite: false,
                        lines: returnObject,
                        label: 'Ask the Fate Chart'),
                  );
                },
                wrapControls: wrapControls,
              ),

              Wrap(
                spacing: 10.0,
                children: [
                  ListButton(
                      label: 'Test Your Expected Scene',
                      onPressed: () {
                        ReturnObject test = testScene(context);

                        // For Bubble
                        setState(() {
                          line1 = test.line1!;
                          line2 = test.line2;
                          line3 = test.result;
                        });

                        appState.addOracleEntry(
                          OracleEntry(
                              isFavourite: false,
                              lines: test,
                              label: 'Test Expected Scene'),
                        );
                      }),
                  ListButton(
                    label: 'Mythic Action',
                    onPressed: () {
                      getRandomResult(
                        appState: appState,
                        label: 'Mythic Action',
                        jsonPath: 'mythic/mythic_action.json',
                        table1: 'table1',
                        table2: 'table2',
                        onResult: (appState, result, label) {
                          updateState(result);
                          appState.addMythicEntry(
                            MythicEntry(
                              isFavourite: false,
                              lines: result,
                              label: 'Mythic Action',
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ListButton(
                    label: 'Mythic Description',
                    onPressed: () {
                      getRandomResult(
                        appState: appState,
                        label: 'Mythic Description',
                        jsonPath: 'mythic/mythic_description.json',
                        table1: 'table1',
                        table2: 'table2',
                        onResult: (appState, result, label) {
                          updateState(result);
                          appState.addMythicEntry(
                            MythicEntry(
                              isFavourite: false,
                              lines: result,
                              label: 'Mythic Description',
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ListButton(
                    label: 'Event Focus',
                    onPressed: () {
                      getEventFocus(appState);
                    },
                  ),
                  ListButton(
                    label: 'Plot Twist',
                    onPressed: () {
                      getRandomResult(
                        appState: appState,
                        label: 'Mythic - Plot Twist',
                        jsonPath: 'mythic_elements/plot_twist.json',
                        table1: 'table',
                        table2: 'table',
                        onResult: (appState, result, label) {
                          updateState(result);
                          appState.addOracleEntry(
                            OracleEntry(
                                isFavourite: false,
                                lines: result,
                                label: 'Plot Twist'),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const Gap(),
              const Divider(),

              // const MarkdownBlock(
              //   newString: '# hello\n*hello* hello\n- hello',
              // ),
              // TODO: Replace this with menuSpacer or other way round
              const Gap(),
              if (showFutureFeatures)
                ListButton(
                  label: 'End Scene',
                  onPressed: () {
                    appState.toggleShowPopup(PopupLabels.endScene);
                  },
                ),

              // combat,
              // social,
              // exploration,
              // travel,
              // investigate,
            ]),
          ),
        ],
      );
    });
  }
}

// TODO: Add this to display manual journal entries
class MarkdownBlock extends StatelessWidget {
  const MarkdownBlock({
    super.key,
    required this.newString,
  });

  final String newString;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      softLineBreak: true,
      styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
      styleSheet: MarkdownStyleSheet(
        // textScaler: const TextScaler.linear(1.5),
        p: const TextStyle(
          color: CupertinoColors.systemRed,
        ),
        em: const TextStyle(
          color: CupertinoColors.systemPink,
        ),
      ),
      data: newString,
    );
  }
}
