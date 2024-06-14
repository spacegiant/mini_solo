import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
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
      ListButton(
        label: 'Type',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Size',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Impulse',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Method',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Attacks',
        onPressed: () {
          // TODO
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Do something',
        onPressed: () {
          // TODO
        },
      ),
    ]);
  }
}
