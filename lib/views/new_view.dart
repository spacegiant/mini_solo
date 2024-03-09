import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/build_popup.dart';
import '../widgets/list_button.dart';
import 'new/new_scene.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Create a new ...',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      ListButton(
          label: 'Scene',
          onPressed: () {
            buildPopup(
              context,
              'New Scene',
              const NewSceneMenu(),
            );
          }),
      const ListButton(label: 'Person', onPressed: doSomething),
      const ListButton(label: 'Place', onPressed: doSomething),
      const ListButton(label: 'Thing', onPressed: doSomething),
      const ListButton(label: 'Faction', onPressed: doSomething),
      const ListButton(label: 'Clue', onPressed: doSomething),
      const ListButton(label: 'Creature', onPressed: doSomething),
      const ListButton(label: '5 Room Dungeon', onPressed: doSomething),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
