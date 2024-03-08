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
            buildShowCupertinoModalPopup(context, const NewSceneMenu());
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
      BuildContext context, Widget child) {
    return showCupertinoModalPopup(
        useRootNavigator: false,
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(
            child: Container(
              color: CupertinoColors.white,
              alignment: Alignment.center,
              width: double.infinity,
              // height: 400,
              child: SafeArea(
                child: Column(children: [
                  CupertinoButton(
                    child: const Text('HI'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  child,
                ]),
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
    return const Text('Passed in Widget');
  }
}

void doSomething() {
  print('pressed');
}
