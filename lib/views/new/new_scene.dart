import 'package:flutter/cupertino.dart';

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
          setState(() {
            outputText = mythicAction();
          });
        },
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: () {
          setState(() {
            outputText = mythicDescription();
          });
        },
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

String mythicAction() {
  MythicDescriptionData mythicDescriptions = MythicDescriptionData();
  ({String description1, String description2}) result =
      mythicDescriptions.consult;
  String description1 = result.description1;
  String description2 = result.description2;
  return '$description1\n$description2';
}

String mythicDescription() {
  MythicDescriptionData mythicDescriptions = MythicDescriptionData();
  ({String description1, String description2}) result =
      mythicDescriptions.consult;
  String description1 = result.description1;
  String description2 = result.description2;
  return '$description1\n$description2';
}
