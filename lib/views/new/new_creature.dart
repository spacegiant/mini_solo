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
        label: const Text('Type'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Size'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Impulse'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Method'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Attacks'),
        onPressed: () {
          // TODO
        },
      ),
      menuSpacer(),
      ListButton(
        label: const Text('Do something'),
        onPressed: () {
          // TODO
        },
      ),
    ]);
  }
}
