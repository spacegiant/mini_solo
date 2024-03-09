import 'package:flutter/cupertino.dart';

import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';
import '../settings_view.dart';

class NewSceneMenu extends StatelessWidget {
  const NewSceneMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      Output(
        text: ['This is a *test* test', 'This is a *test* test '],
      ),
      ListButton(
        label: 'Mythic Action',
        onPressed: doSomething,
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
    ]);
  }
}

void doSomething() {
  print('pressed');
}

String mythicAction() {
  return 'This is a *Mythic Action* test';
}
