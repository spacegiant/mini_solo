import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      ListButton(label: 'Scene', onPressed: doSomething),
      ListButton(label: 'Person', onPressed: doSomething),
      ListButton(label: 'Place', onPressed: doSomething),
      ListButton(label: 'Thing', onPressed: doSomething),
      ListButton(label: 'Faction', onPressed: doSomething),
      ListButton(label: 'Clue', onPressed: doSomething),
      ListButton(label: 'Creature', onPressed: doSomething),
      ListButton(label: '5 Room Dungeon', onPressed: doSomething),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
