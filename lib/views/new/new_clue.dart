import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';

class NewClueMenu extends StatefulWidget {
  const NewClueMenu({super.key});

  @override
  State<NewClueMenu> createState() => _NewClueMenuState();
}

class _NewClueMenuState extends State<NewClueMenu> {
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
        label: 'Who',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'What',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'When',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Where',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'How',
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
