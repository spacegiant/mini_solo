import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/speech_bubble/bubble_text.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_state.dart';
import '../../utilities/campaign_data.dart';
import '../../utilities/consult_oracle.dart';
import '../../utilities/convert_for_journal.dart';
import '../../utilities/get_twice_from_table.dart';
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

  void updateBubble({
    required AppState appState,
    required ReturnObject result,
    required String label,
  }) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
    });

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
              getMythicAction(appState);
            },
          ),
          ListButton(
            label: 'Mythic Description',
            onPressed: () {
              getMythicDescription(appState);
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
              getPlotTwist(appState);
            },
          ),
          ListButton(
            label: 'Characters',
            onPressed: () {
              getCharacters(appState);
            },
          ),
          ListButton(
            label: 'Characters Appearance',
            onPressed: () {
              getCharactersAppearance(appState);
            },
          )
        ]);
      },
    );
  }

  void getPlotTwist(AppState appState) {
    return getTwiceFromTable(
      appState,
      'plot_twist',
      'Mythic - Plot Twist',
      (result, label) {
        updateBubble(
          appState: appState,
          result: result,
          label: label,
        );
      },
    );
  }

  void getCharacters(AppState appState) {
    return getTwiceFromTable(
      appState,
      'characters',
      'Mythic - Characters',
      (result, label) {
        updateBubble(
          appState: appState,
          result: result,
          label: label,
        );
      },
    );
  }

  void getCharactersAppearance(AppState appState) {
    return getTwiceFromTable(
      appState,
      'characters_appearance',
      'Mythic - Characters Appearance',
      (result, label) {
        updateBubble(
          appState: appState,
          result: result,
          label: label,
        );
      },
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

  void getMythicDescription(AppState appState) {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
        .then((value) {
      List<String> table1 = List<String>.from(value['description1']);
      List<String> table2 = List<String>.from(value['description2']);

      ReturnObject result = consultOracle(
        table1: table1,
        table2: table2,
      );

      updateBubble(
        appState: appState,
        result: result,
        label: 'Mythic Description',
      );
    });
  }

  void getMythicAction(AppState appState) {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
        .then((value) {
      List<String> table1 = List<String>.from(value['action1']);
      List<String> table2 = List<String>.from(value['action2']);

      ReturnObject result = consultOracle(
        table1: table1,
        table2: table2,
      );

      updateBubble(
        appState: appState,
        result: result,
        label: 'Mythic Action',
      );
    });
  }
}
