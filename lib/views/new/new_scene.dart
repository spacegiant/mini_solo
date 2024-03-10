import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/mythic_action_data.dart';

import '../../data/mythic_description_data.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';

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
          MythicActionData mythicActions = MythicActionData();
          setState(() {
            outputText = consultOracle(
              table1: mythicActions.table1,
              table2: mythicActions.table2,
            );
          });
        },
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: () {
          MythicDescriptionData mythicDescriptions = MythicDescriptionData();
          setState(() {
            outputText = consultOracle(
              table1: mythicDescriptions.table1,
              table2: mythicDescriptions.table2,
            );
          });
        },
      ),
    ]);
  }
}

void doSomething() {
  print('pressed');
}

String consultTable(List<String> table) {
  int random = Random().nextInt(table.length);
  return table[random];
}

String consultOracle({required List<String> table1, List<String>? table2}) {
  String result1 = consultTable(table1);
  String result2 = table2 != null ? '\n${consultTable(table2)}' : '';
  return '$result1$result2';
}
