import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewClueMenu extends StatefulWidget {
  const NewClueMenu({super.key});

  @override
  State<NewClueMenu> createState() => _NewClueMenuState();
}

class _NewClueMenuState extends State<NewClueMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
        label: 'Who',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'What',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'When',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Where',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'How',
        onPressed: () {
          // TODO
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Save',
        onPressed: () {
          // TODO
        },
      ),
    ]);
  }
}
