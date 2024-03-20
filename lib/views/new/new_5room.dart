import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menuSpacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
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
  late var mythicJSON = {};

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        line1: line1,
        line2: line2,
        line3: line3,
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
