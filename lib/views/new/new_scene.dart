import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/speech_bubble/bubble_text.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../utilities/convert_for_journal.dart';
import '../../utilities/get_random_result.dart';
import '../../utilities/get_weighted_result.dart';
import '../../utilities/test_scene.dart';
import '../../utilities/update_journal.dart';
import '../../widgets/gap.dart';
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
  String type = '...';
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

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, AppState appState, Widget? child) {
        handleUpdateBubble(
          AppState appState,
          ReturnObject result,
          String? label,
        ) {
          updateState(result);
          updateJournal(appState, result, label!);
        }

        return ViewWrapper(children: [
          SpeechBubble(
            widget: BubbleText(
              lines: [
                line1,
                line2,
                line3,
              ],
              type: type,
            ),
          ),
          ListButton(
            label: 'End previous scene',
            onPressed: () {
              handleUpdateBubble(
                appState,
                ReturnObject(
                  line1: 'New Scene',
                  type: 'test',
                ),
                'New scene',
              );
            },
          ),
          ListButton(
              label: 'Test Your Expected Scene',
              onPressed: () {
                ReturnObject test = testScene(context);

                // For Bubble
                setState(() {
                  line1 = test.line1;
                  line2 = test.line2;
                  line3 = test.line3;
                });

                appState.addJournalEntry(
                  JournalEntryItem(
                    isFavourite: false,
                    // label: 'Test Scene',
                    // title: line1,
                    // detail: convertToJournalEntry(
                    //   test.line1,
                    //   test.line2,
                    //   test.line3,
                    // ),
                    type: JournalEntryTypes.oracle,
                    id: '',
                  ),
                );
              }),
          const Gap(),
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
        ]);
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
          // title: convertToJournalEntry(
          //   text,
          //   null,
          //   null,
          // ),
          type: JournalEntryTypes.oracle,
          // label: 'Mythic Event Focus',
          id: '',
        ),
      );
    });
  }
}
