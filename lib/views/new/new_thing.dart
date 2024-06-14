import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewThingMenu extends StatefulWidget {
  const NewThingMenu({super.key});

  @override
  State<NewThingMenu> createState() => _NewThingMenuState();
}

class _NewThingMenuState extends State<NewThingMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
        label: 'Name',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Object Type',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Condition',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Owner',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Function',
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
