import 'package:flutter/cupertino.dart';
import '../../widgets/list_button.dart';
import '../../widgets/menu_spacer.dart';
import '../../widgets/output.dart';
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
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      // TODO: Make this like a character sheet or add objects as rolled
      Output(
        line1: line1,
        line2: line2,
        line3: line3,
      ),
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
      ListButton(
          label: 'Sex',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Gender',
          onPressed: () {
            print('Pressed');
          }),
      menuSpacer(),
      ListButton(
          label: 'Physical Appearance',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Demeanour',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'True Self',
          onPressed: () {
            print('Pressed');
          }),
      menuSpacer(),
      ListButton(
          label: 'Copy/Send to Journal',
          onPressed: () {
            print('Pressed');
          }),
      ListButton(
          label: 'Save',
          onPressed: () {
            print('Pressed');
          }),
    ]);
  }
}
