import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class ListsView extends StatelessWidget {
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(label: const Text('Characters'), onPressed: () {}),
      ListButton(label: const Text('Threads'), onPressed: () {}),
      ListButton(label: const Text('Starred items'), onPressed: () {}),
      const SizedBox(height: 16.0),
      ListButton(label: const Text('People'), onPressed: () {}),
      ListButton(label: const Text('Places'), onPressed: () {}),
      ListButton(label: const Text('Things'), onPressed: () {}),
      ListButton(label: const Text('Factions'), onPressed: () {}),
      ListButton(label: const Text('Clues'), onPressed: () {}),
      ListButton(label: const Text('Creatures'), onPressed: () {}),
    ]);
  }
}
