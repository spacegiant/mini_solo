import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class SceneView extends StatelessWidget {
  const SceneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      ListButton(
        label: 'Mythic Action',
        handlePress: doSomething,
      ),
      ListButton(
        label: 'Mythic Description',
        handlePress: doSomething,
      ),
      ListButton(
        label: 'Mythic Description',
        handlePress: doSomething,
      ),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
