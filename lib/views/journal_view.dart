import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/views/dice/dice_button.dart';
import 'package:mini_solo/views/dice/fate_dice.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/app_state.dart';
import '../data/campaign_data.dart';
import '../features/random_tables/random_table_controls.dart';
import '../icons.dart';
import '../utilities/get_random_result.dart';
import '../utilities/get_weighted_result.dart';
import '../utilities/test_scene.dart';
import '../widgets/gap.dart';
import '../widgets/journal/journal.dart';
import '../widgets/journal/widgets/journal_subheading.dart';
import 'dice/dice.dart';
import 'dice/dice_collection.dart';
import 'dice/other_dice_sets.dart';
import 'dice/regular_dice_set.dart';
import 'mythic/fate_question.dart';

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
          lines: JournalReturnObject(
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
      // bool showFutureFeatures =
      //     appState.campaignData!.settings.general.showFutureSettings;

      GeneralSettingsData generalSettings =
          appState.campaignData!.settings.general;
      bool useZocchiDice = generalSettings.useZocchiDice;
      bool useRegularDice = generalSettings.useRegularDice;
      bool useGeneralDice = useZocchiDice && useRegularDice;
      bool useFateDice = generalSettings.useFateDice;
      bool useCoriolisDice = generalSettings.useCoriolisDice;
      bool useD6OracleDice = generalSettings.useD6Oracle;

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

      DiceSet? generalDiceSubset;

      if (useGeneralDice) {
        generalDiceSubset = all;
      } else if (useZocchiDice) {
        generalDiceSubset = zocchiDice;
      } else if (useRegularDice) {
        generalDiceSubset = regularDice;
      }

      DiceCollection? generalDice = generalDiceSubset != null
          ? DiceCollection(
              diceSet: generalDiceSubset,
              appState: appState,
              onPressed: addResult,
            )
          : null;

      return FocusScope(
        child: Column(
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

                diceTray(
                  wrapControls,
                  useD6OracleDice,
                  addResult,
                  useFateDice,
                  useCoriolisDice,
                  generalDice,
                ),

                const JournalSubheading(label: kJournalMythicFateChartTitle),

                FateQuestion(
                  callback: (JournalReturnObject returnObject) {
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
                          label: kJournalMythicAskTheFateChart),
                    );
                  },
                  wrapControls: wrapControls,
                ),

                const JournalSubheading(
                  label: kJournalMythicGMETitle,
                ),

                mythicGMEControls(wrapControls, appState, context),

                const JournalSubheading(
                  label: kJournalRandomTablesTitle,
                ),

                RandomTables(
                  appState: appState,
                ),
                const Divider(),
                const Text('Create New Item Toolbar Here'),
                const Divider(),
                const JournalSubheading(
                  label: 'Import/Export',
                ),
                WrapManager(wrapControls: wrapControls, children: [
                  ListButton(
                      label: 'Export Campaign',
                      onPressed: () async {
                        CampaignData? campaignData = appState.campaignData;
                        String jsonString =
                            appState.storage.getCampaignJSON(campaignData!);
                        await Clipboard.setData(
                            ClipboardData(text: jsonString));
                        // copied successfully
                      }),
                  ListButton(
                      label: 'Import Campaign',
                      onPressed: () {
                        // TODO
                      }),
                  ListButton(
                      label: 'Export AppSettings',
                      onPressed: () async {
                        AppSettingsData? appSettingsData =
                            appState.appSettingsData;
                        String jsonString =
                            appState.storage.appSettingsToJSON(appSettingsData);
                        await Clipboard.setData(
                            ClipboardData(text: jsonString));
                        // copied successfully
                      }),
                  ListButton(
                      label: 'Import AppSettings',
                      onPressed: () {
                        // TODO
                      }),
                ]),

                const Divider(),

                // const MarkdownBlock(
                //   newString: '# hello\n*hello* hello\n- hello',
                // ),
              ]),
            ),
          ],
        ),
      );
    });
  }

  WrapManager mythicGMEControls(
      bool wrapControls, AppState appState, BuildContext context) {
    return WrapManager(
      wrapControls: wrapControls,
      children: [
        ListButton(
          label: 'New Scene',
          color: Colors.black,
          onPressed: () {
            appState.addNewScene();
          },
        ),
        ListButton(
            label: 'Test Your Expected Scene',
            onPressed: () {
              JournalReturnObject test = testScene(context);

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
                  // TODO: Can MythicEntry be swapped and eventually removed?
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
                      isFavourite: false, lines: result, label: 'Plot Twist'),
                );
              },
            );
          },
        ),
      ],
    );
  }

  WrapManager diceTray(
      bool wrapControls,
      bool useD6OracleDice,
      void Function(List<DiceRoll> result) addResult,
      bool useFateDice,
      bool useCoriolisDice,
      DiceCollection? generalDice) {
    return WrapManager(
      wrapControls: wrapControls,
      hideDivider: true,
      children: [
        if (useD6OracleDice)
          DiceButton(
            dieType: d6oracle,
            label: 'D6 Oracle',
            icon: Images.d6Oracle,
            onPressed: addResult,
          ),
        if (useFateDice) ...[
          DiceButton(
            color: CupertinoColors.systemOrange,
            dieType: fate,
            numberOfRolls: 4,
            label: '4dF',
            onPressed: addResult,
            icon: Images.fateDice,
          ),
        ],
        if (useCoriolisDice)
          DiceButton(
            dieType: coriolis,
            label: 'Coriolis',
            icon: Images.coriolis6,
            onPressed: addResult,
          ),
        if (generalDice != null) ...generalDice.getDice(),
      ],
    );
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
