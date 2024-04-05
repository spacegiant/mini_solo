import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_state.dart';
import '../../utilities/get_random_result.dart';
import '../../utilities/update_journal.dart';
import '../../widgets/list_button.dart';
import '../../widgets/menu_spacer.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';
import '../journal_view.dart';

class NewPersonMenu extends StatefulWidget {
  const NewPersonMenu({super.key});

  @override
  State<NewPersonMenu> createState() => _NewPersonMenuState();
}

class _NewPersonMenuState extends State<NewPersonMenu> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  void updateState(ReturnObject result) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
    });
  }

  @override
  Consumer build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        handleUpdateBubble(
          AppState appState,
          ReturnObject result,
          String label,
        ) {
          updateState(result);
          updateJournal(appState, result, label);
        }

        return ViewWrapper(children: [
          // TODO: Make this like a character sheet or add objects as rolled
          SpeechBubble(
            widget: BubbleText(lines: [
              line1,
              line2,
              line3,
            ]),
          ),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Randomise All',
                onPressed: () {
                  print('Pressed');
                }),
          ListButton(
              label: 'Name',
              onPressed: () {
                print('Pressed');
              }),
          const Text('Character Details'),
          ListButton(
            label: 'Character',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character',
                jsonPath: 'mythic_elements/characters.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Appearance',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Appearance',
                jsonPath: 'mythic_elements/characters_appearance.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Background',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Background',
                jsonPath: 'mythic_elements/characters_background.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Conversation',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Conversation',
                jsonPath: 'mythic_elements/characters_conversations.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Descriptors',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Descriptors',
                jsonPath: 'mythic_elements/characters_descriptors.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Identity',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Identity',
                jsonPath: 'mythic_elements/characters_identity.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Motivation',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Motivation',
                jsonPath: 'mythic_elements/characters_motivations.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Personality',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Personality',
                jsonPath: 'mythic_elements/characters_personality.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Skills',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Skills',
                jsonPath: 'mythic_elements/characters_skills.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          ListButton(
            label: 'Traits and Flaws',
            onPressed: () {
              getRandomResult(
                appState: appState,
                label: 'Mythic - Character Traits and Flaws',
                jsonPath: 'mythic_elements/characters_traits_and_flaws.json',
                table1: 'table',
                table2: 'table',
                onResult: handleUpdateBubble,
              );
            },
          ),
          const Text('Other'),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Sex',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Gender',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true) menuSpacer(),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Physical Appearance',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Demeanour',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'True Self',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true) menuSpacer(),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Copy/Send to Journal',
                onPressed: () {
                  print('Pressed');
                }),
          if (appState.showFutureFeatures == true)
            ListButton(
                label: 'Save',
                onPressed: () {
                  print('Pressed');
                }),
        ]);
      },
    );
  }
}
