import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
          label: 'Scene',
          onPressed: () {
            buildShowCupertinoModalPopup(
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

  Future<dynamic> buildShowCupertinoModalPopup(
    BuildContext context,
    final String label,
    final Widget child,
  ) {
    return showCupertinoModalPopup(
        useRootNavigator: false,
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(
            child: Container(
              color: CupertinoColors.white,
              width: double.infinity,
              child: CupertinoPageScaffold(
                backgroundColor: CupertinoColors.activeOrange,
                navigationBar: CupertinoNavigationBar(
                  middle: Text(label),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Output box here'),
                      const Text('checkbox here'),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class NewSceneMenu extends StatelessWidget {
  const NewSceneMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('New scene menu goes here');
  }
}

void doSomething() {
  print('pressed');
}
