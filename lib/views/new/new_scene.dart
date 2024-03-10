import 'package:flutter/cupertino.dart';

import '../../data/mythic_action_data.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';
import '../settings_view.dart';

class NewSceneMenu extends StatefulWidget {
  const NewSceneMenu({super.key});

  @override
  State<NewSceneMenu> createState() => _NewSceneMenuState();
}

class _NewSceneMenuState extends State<NewSceneMenu> {
  String outputText = '...';
  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        text: [outputText],
      ),
      ListButton(
        label: 'Mythic Action',
        onPressed: () {
          setState(() {
            MythicActionData mythicActions = MythicActionData();
            ({String action1, String action2}) result = mythicActions.consult;
            String action1 = result.action1;
            String action2 = result.action2;
            outputText = '$action1\n$action2';
          });
        },
      ),
      const ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
      const ListButton(
        label: 'Mythic Description',
        onPressed: doSomething,
      ),
    ]);
  }
}

void doSomething() {
  print('pressed');
}
