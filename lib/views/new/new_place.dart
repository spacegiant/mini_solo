import 'package:flutter/cupertino.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class NewPlaceMenu extends StatefulWidget {
  const NewPlaceMenu({super.key});

  @override
  State<NewPlaceMenu> createState() => _NewPlaceMenuState();
}

class _NewPlaceMenuState extends State<NewPlaceMenu> {
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
        label: 'Place Name',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Add Feature',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Problem',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Famed for...',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Details',
        onPressed: () {
          print('Pressed');
        },
      ),
    ]);
  }
}
