import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      ListButton(label: 'Person', handlePress: doSomething),
      ListButton(label: 'Place', handlePress: doSomething),
      ListButton(label: 'Thing', handlePress: doSomething),
      ListButton(label: 'Faction', handlePress: doSomething),
      ListButton(label: 'Clue', handlePress: doSomething),
      ListButton(label: 'Creature', handlePress: doSomething),
      ListButton(label: '5 Room Dungeon', handlePress: doSomething),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
