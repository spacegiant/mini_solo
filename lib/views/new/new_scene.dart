import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/speech_bubble/bubble_text.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_state.dart';
import '../../utilities/campaign_data.dart';
import '../../utilities/consult_oracle.dart';
import '../../utilities/convert_for_journal.dart';
import '../../utilities/get_weighted_result.dart';
import '../../utilities/read_json_file.dart';
import '../../widgets/chaos_factor_panel.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';
import '../journal_view.dart';

class NewSceneMenu extends StatefulWidget {
  const NewSceneMenu({super.key});

  @override
  State<NewSceneMenu> createState() => _NewSceneMenuState();
}

class _NewSceneMenuState extends State<NewSceneMenu> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;
  late var mythicJSON = {};

  void updateState(ReturnObject result) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
    });
  }

  void updateBubble({
    required AppState appState,
    required ReturnObject result,
    required String label,
  }) {
    updateState(result);

    appState.addJournalEntry(JournalEntryItem(
      isFavourite: false,
      title: convertToJournalEntry(
        line1 = result.line1,
        line2 = result.line2,
        line3 = null,
      ),
      type: JournalEntryTypes.oracle,
      label: label,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, AppState appState, Widget? child) {
        return ViewWrapper(children: [
          SpeechBubble(
            widget: BubbleText(lines: [
              line1,
              line2,
              line3,
            ]),
          ),
          ListButton(
            label: 'Mythic Action',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic Action',
                jsonPath: 'mythic/mythic_action.json',
                table1: 'table1',
                table2: 'table2',
                onResult: handleUpdateBubble,
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
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Event Focus',
            onPressed: () {
              getEventFocus(appState);
            },
          ),
          const ChaosFactorPanel(),
          const Text('Mythic Elements'),
          ListButton(
            label: 'Plot Twist',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Plot Twist',
                jsonPath: 'mythic_elements/plot_twist.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Characters',
            onPressed: () {
              // getCharacters(appState);
              getRandomResult(
                appState: appState,
                label: 'Mythic - Characters',
                jsonPath: 'mythic_elements/characters.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Characters Appearance',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Characters Appearance',
                jsonPath: 'mythic_elements/characters_appearance.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Characters Background',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Characters Background',
                jsonPath: 'mythic_elements/characters_background.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          )
        ]);
      },
    );
  }

  getRandomResult({
    required AppState appState,
    required String label,
    required String jsonPath,
    required String table1,
    required String? table2,
    required Function(
      dynamic appState,
      dynamic result,
      dynamic label,
    ) onResult,
  }) {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/$jsonPath').then((value) {
      List<String> t1 = List<String>.from(value[table1]);
      List<String> t2 = List<String>.from(value[table2]);

      ReturnObject result = consultOracle(
        table1: t1,
        table2: t2,
      );

      onResult(appState, result, label);
    });
  }

  handleUpdateBubble(appState, result, label) {
    updateBubble(
      appState: appState,
      result: result,
      label: label,
    );
  }

  getEventFocus(AppState appState) {
    getWeightedResult('lib/assets/json/mythic.json', (String text) {
      setState(() {
        line1 = text;
        line2 = null;
        line3 = null;
      });

      //  Save to campaign data and push to journal
      appState.addJournalEntry(
        JournalEntryItem(
          isFavourite: false,
          title: convertToJournalEntry(
            text,
            null,
            null,
          ),
          type: JournalEntryTypes.oracle,
          label: 'Mythic Event Focus',
        ),
      );
    });
  }
}
