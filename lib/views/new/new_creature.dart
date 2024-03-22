import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';

class NewCreatureMenu extends StatefulWidget {
  const NewCreatureMenu({super.key});

  @override
  State<NewCreatureMenu> createState() => _NewCreatureMenuState();
}

class _NewCreatureMenuState extends State<NewCreatureMenu> {
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
