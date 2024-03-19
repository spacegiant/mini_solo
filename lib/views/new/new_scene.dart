import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/mythic_action_data.dart';
import 'package:mini_solo/data/mythic_elements_plot_twist.dart';
import 'package:mini_solo/my_homepage.dart';
import 'package:provider/provider.dart';

import '../../data/mythic_description_data.dart';
import '../../data/mythic_event_focus_data.dart';
import '../../utilities/read_json_file.dart';
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
  late var mythicJSON = {};

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        text: [outputText],
      ),
      ListButton(
        label: 'Mythic Action',
        onPressed: () {
          ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
              .then((value) {
            List<String> table1 = List<String>.from(value['action1']);
            List<String> table2 = List<String>.from(value['action2']);
            setState(() {
              outputText = consultOracle(
                table1: table1,
                table2: table2,
              );
            });
          });
        },
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: () {
          ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
              .then((value) {
            List<String> table1 = List<String>.from(value['description1']);
            List<String> table2 = List<String>.from(value['description2']);
            setState(() {
              outputText = consultOracle(
                table1: table1,
                table2: table2,
              );
            });
          });
        },
      ),
      ListButton(
        label: 'Event Focus',
        onPressed: () {
          MythicEventFocusData mythicEvents = MythicEventFocusData();
          setState(() {
            List<WeightedItem> mythicEventsTable = mythicEvents.table1;
            // Get total weights from list
            int weightsSum = 0;
            for (var i = 0; i < mythicEventsTable.length; i++) {
              weightsSum = weightsSum + mythicEventsTable[i].weight;
            }
            // Get random number between 0 and weightSum
            int randomRoll = Random().nextInt(weightsSum - 1);

            // Find the item in the list that corresponds with the random number
            int tally = 0;
            for (var j = 0; j < mythicEventsTable.length; j++) {
              tally += mythicEventsTable[j].weight;
              if (randomRoll < tally) {
                outputText = mythicEventsTable[j].text;
                return;
              }
            }
          });
        },
      ),
      const Text('Chaos Factor'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListButton(
              labelAlignment: Alignment.center,
              label: 'Up',
              onPressed: () {
                var chaosFactor = context.read<ChaosFactor>();
                chaosFactor.increase();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Consumer<ChaosFactor>(
              builder: (context, chaosFactor, child) => SizedBox(
                width: 30.0,
                child: Center(
                  child: Text(
                    chaosFactor.chaosFactor.toString(),
                    style: const TextStyle(
                        fontSize: 36.0, color: CupertinoColors.systemPink),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListButton(
              labelAlignment: Alignment.center,
              label: 'Down',
              onPressed: () {
                var chaosFactor = context.read<ChaosFactor>();
                chaosFactor.decrease();
              },
            ),
          ),
        ],
      ),
      const Text('Mythic Elements'),
      ListButton(
        label: 'Plot Twist',
        onPressed: () {
          ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
              .then((value) {
            List<String> table1 =
                List<String>.from(value['elements']['plot_twist']);
            List<String> table2 =
                List<String>.from(value['elements']['plot_twist']);
            setState(() {
              outputText = consultOracle(
                table1: table1,
                table2: table2,
              );
            });
          });
        },
      )
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
