import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class NewFactionMenu extends StatefulWidget {
  const NewFactionMenu({super.key});

  @override
  State<NewFactionMenu> createState() => _NewFactionMenuState();
}

class _NewFactionMenuState extends State<NewFactionMenu> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;
  late var mythicJSON = {};

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      SpeechBubble(
        widget: BubbleText(lines: [
          line1,
          line2,
          line3,
        ]),
      ),
      ListButton(
        label: 'Purpose',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Faction Name',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Secret',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Goal',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Logo/Icon',
        onPressed: () {
          print('Pressed');
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Purpose',
        onPressed: () {
          print('Save');
        },
      ),
    ]);
  }
}
