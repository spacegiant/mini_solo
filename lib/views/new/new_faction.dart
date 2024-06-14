import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/menu_spacer.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewFactionMenu extends StatefulWidget {
  const NewFactionMenu({super.key});

  @override
  State<NewFactionMenu> createState() => _NewFactionMenuState();
}

class _NewFactionMenuState extends State<NewFactionMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
        label: 'Purpose',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Faction Name',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Secret',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Goal',
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: 'Logo/Icon',
        onPressed: () {
          // TODO
        },
      ),
      menuSpacer(),
      ListButton(
        label: 'Purpose',
        onPressed: () {
          print('Save');
        },
      ),
    ]);
  }
}
