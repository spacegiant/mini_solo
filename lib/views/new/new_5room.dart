import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/speech_bubble/bubble_text.dart';
import '../../widgets/speech_bubble/speech_bubble.dart';
import '../../widgets/view_wrapper.dart';

class New5RoomMenu extends StatefulWidget {
  const New5RoomMenu({super.key});

  @override
  State<New5RoomMenu> createState() => _New5RoomMenuState();
}

class _New5RoomMenuState extends State<New5RoomMenu> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;

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
          label: 'Random',
          onPressed: () {
            print('Pressed');
          }),
      menuSpacer(),
      ListButton(
          label: 'Room1',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Room2',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Room3',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Room4',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Room5',
          onPressed: () {
            print('Pressed');
          }),
      menuSpacer(),
      ListButton(
          label: 'Save',
          onPressed: () {
            print('Pressed');
          }),
    ]);
  }
}
