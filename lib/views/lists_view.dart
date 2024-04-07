import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class ListsView extends StatelessWidget {
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(label: 'Characters', onPressed: () {}),
      ListButton(label: 'Threads', onPressed: () {}),
      ListButton(label: 'Starred items', onPressed: () {}),
      const SizedBox(height: 16.0),
      ListButton(label: 'People', onPressed: () {}),
      ListButton(label: 'Places', onPressed: () {}),
      ListButton(label: 'Things', onPressed: () {}),
      ListButton(label: 'Factions', onPressed: () {}),
      ListButton(label: 'Clues', onPressed: () {}),
      ListButton(label: 'Creatures', onPressed: () {}),
    ]);
  }
}
