import 'package:flutter/cupertino.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewPlaceMenu extends StatefulWidget {
  const NewPlaceMenu({super.key});

  @override
  State<NewPlaceMenu> createState() => _NewPlaceMenuState();
}

class _NewPlaceMenuState extends State<NewPlaceMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
        label: const Text('Place Name'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Add Feature'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Problem'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Famed for...'),
        onPressed: () {
          // TODO
        },
      ),
      ListButton(
        label: const Text('Details'),
        onPressed: () {
          // TODO
        },
      ),
    ]);
  }
}
