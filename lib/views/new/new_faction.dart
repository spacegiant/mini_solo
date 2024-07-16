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
        label: const Text('Purpose'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Faction Name'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Secret'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Goal'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Logo/Icon'),
        onPressed: () {
          // TODO
        },
      ),
      menuSpacer(),
      ListButton(
        label: const Text('Purpose'),
        onPressed: () {
          print('Save');
        },
      ),
    ]);
  }
}
