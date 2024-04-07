import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class NewCreatureMenu extends StatefulWidget {
  const NewCreatureMenu({super.key});

  @override
  State<NewCreatureMenu> createState() => _NewCreatureMenuState();
}

class _NewCreatureMenuState extends State<NewCreatureMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
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
        label: 'Type',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Size',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Impulse',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Method',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Attacks',
        onPressed: () {
          print('Pressed');
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Do something',
        onPressed: () {
          print('Pressed');
        },
      ),
    ]);
  }
}
