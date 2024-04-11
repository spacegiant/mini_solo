import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../utilities/get_random_result.dart';
import '../../utilities/update_journal.dart';
import '../../widgets/gap.dart';
import '../../widgets/list_button.dart';
import '../../widgets/menu_spacer.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class NewPersonMenu extends StatefulWidget {
  const NewPersonMenu({super.key});

  @override
  State<NewPersonMenu> createState() => _NewPersonMenuState();
}

class _NewPersonMenuState extends State<NewPersonMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  void updateState(ReturnObject result) {
    setState(() {
      line1 = result.line1;
      line2 = result.line2;
      line3 = null;
      type = result.type;
    });
  }

  @override
  Consumer build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        return ViewWrapper(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                RandomiserButton(
                  label: 'Name',
                  value: '...',
                  onTap: () {
                    print('hello');
                  },
                  onLongPress: () {
                    appState.setPopupLabel(PopupLabels.editField);
                    appState.toggleShowPopup();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RandomiserButton(
                  label: 'Title',
                  value: '...',
                  onTap: () {},
                  onLongPress: () {},
                ),
                const Gap(),
                RandomiserButton(
                  label: 'First',
                  value: '...',
                  flex: 2,
                  onTap: () {},
                  onLongPress: () {},
                ),
                const Gap(),
                RandomiserButton(
                  label: 'Last',
                  value: '...',
                  flex: 2,
                  onTap: () {},
                  onLongPress: () {},
                ),
              ],
            ),
          ),
          ListButton(
              label: 'Save',
              onPressed: () {
                print('Pressed');
              }),
          const Gap(),
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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
                  onResult: (appState, result, text) {});
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

class RandomiserButton extends StatelessWidget {
  const RandomiserButton({
    super.key,
    required this.label,
    required this.value,
    this.flex = 1,
    required this.onTap,
    required this.onLongPress,
  });

  final String label;
  final String value;
  final int flex;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          color: CupertinoColors.systemYellow,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: CupertinoColors.black,
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.refresh,
                      color: CupertinoColors.black,
                      size: 12.0,
                    )
                  ],
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: CupertinoColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
