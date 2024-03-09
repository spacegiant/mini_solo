import 'package:flutter/cupertino.dart';

import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewSceneMenu extends StatelessWidget {
  const NewSceneMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
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
    ;
  }
}

void doSomething() {
  print('pressed');
}
