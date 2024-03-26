import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class NewThingMenu extends StatefulWidget {
  const NewThingMenu({super.key});

  @override
  State<NewThingMenu> createState() => _NewThingMenuState();
}

class _NewThingMenuState extends State<NewThingMenu> {
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
        label: 'Name',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Object Type',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Condition',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Owner',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Function',
        onPressed: () {
          print('Pressed');
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Save',
        onPressed: () {
          print('Pressed');
        },
      ),
    ]);
  }
}
