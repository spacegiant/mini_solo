import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class New5RoomMenu extends StatefulWidget {
  const New5RoomMenu({super.key});

  @override
  State<New5RoomMenu> createState() => _New5RoomMenuState();
}

class _New5RoomMenuState extends State<New5RoomMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
          label: const Text('Random'),
          onPressed: () {
            // TODO
          }),
      menuSpacer(),
      ListButton(
          label: const Text('Room1'),
          onPressed: () {
            // TODO
          }),
      ListButton(
          label: const Text('Room2'),
          onPressed: () {
            // TODO
          }),
      ListButton(
          label: const Text('Room3'),
          onPressed: () {
            // TODO
          }),
      ListButton(
          label: const Text('Room4'),
          onPressed: () {
            // TODO
          }),
      ListButton(
          label: const Text('Room5'),
          onPressed: () {
            // TODO
          }),
      menuSpacer(),
      ListButton(
          label: const Text('Save'),
          onPressed: () {
            // TODO
          }),
    ]);
  }
}
