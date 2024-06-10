import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../features/random_tables/random_table_controls.dart';
import '../../utilities/get_random_result.dart';
import '../../utilities/test_scene.dart';
import '../../widgets/gap.dart';
import '../../widgets/journal/widgets/journal_subheading.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';
import '../../widgets/wrap_manager.dart';
import '../mythic/fate_question.dart';
import 'dice_tray.dart';
import 'get_event_focus.dart';

Widget journalControls(
    AppState appState,
    void Function(List<DiceRoll> result) addResult,
    // bool wrapControls,
    BuildContext context) {
  bool wrapControls = appState.wrapControls;
  return ViewWrapper(children: [
    // const Gap(),

    diceTray(
      appState,
      addResult,
    ),

    const JournalSubheading(label: kJournalMythicFateChartTitle),

    FateQuestion(
      callback: (JournalReturnObject returnObject) {
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
    const JournalSubheading(
      label: 'Import/Export',
    ),
    WrapManager(wrapControls: wrapControls, children: [
      ListButton(
          label: 'Import Manager',
          onPressed: () {
            appState.toggleShowPopup(label: PopupLabel.importManager);
          }),
      ListButton(
          label: 'Export Campaign',
          onPressed: () async {
            CampaignData? campaignData = appState.campaignData;
            String jsonString = appState.storage.getCampaignJSON(campaignData!);
            await Clipboard.setData(ClipboardData(text: jsonString));
            // copied successfully
          }),
      ListButton(
          label: 'Export AppSettings',
          onPressed: () async {
            AppSettingsData? appSettingsData = appState.appSettingsData;
            String jsonString =
                appState.storage.appSettingsToJSON(appSettingsData);
            await Clipboard.setData(ClipboardData(text: jsonString));
            // copied successfully
          }),
    ]),

    const Divider(),

    // const MarkdownBlock(
    //   newString: '# hello\n*hello* hello\n- hello',
    // ),
  ]);
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
