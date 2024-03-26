import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../utilities/app_state.dart';
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
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;
  late var mythicJSON = {};

  @override
  Consumer build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
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
