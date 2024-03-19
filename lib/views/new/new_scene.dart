import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../../utilities/get_weighted_result.dart';
import '../../utilities/read_json_file.dart';
import '../../widgets/chaos_factor_panel.dart';
import '../../widgets/list_button.dart';
import '../../widgets/output.dart';
import '../../widgets/view_wrapper.dart';
import '../journal_view.dart';

class NewSceneMenu extends StatefulWidget {
  const NewSceneMenu({super.key});

  @override
  State<NewSceneMenu> createState() => _NewSceneMenuState();
}

class _NewSceneMenuState extends State<NewSceneMenu> {
  String outputText = '...';
  String line1 = '...';
  String? line2;
  String? line3;
  late var mythicJSON = {};

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        line1: line1,
        line2: line2,
        line3: line3,
      ),
      ListButton(
        label: 'Mythic Action',
        onPressed: () {
          getMythicAction();
        },
      ),
      ListButton(
        label: 'Mythic Description',
        onPressed: () {
          getMythicDescription();
        },
      ),
      ListButton(
        label: 'Event Focus',
        onPressed: () {
          getWeightedResult('lib/assets/json/mythic.json', (String text) {
            setState(() {
              line1 = text;
              line2 = null;
              line3 = null;
            });
          });
        },
      ),
      const ChaosFactorPanel(),
      const Text('Mythic Elements'),
      ListButton(
        label: 'Plot Twist',
        onPressed: () {
          getPlotTwist();
        },
      )
    ]);
  }

  void getMythicDescription() {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
        .then((value) {
      List<String> table1 = List<String>.from(value['description1']);
      List<String> table2 = List<String>.from(value['description2']);

      ReturnObject result = consultOracle(
        table1: table1,
        table2: table2,
      );

      setState(() {
        line1 = result.line1;
        line2 = result.line2;
        line3 = null;
      });
    });
  }

  void getMythicAction() {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
        .then((value) {
      List<String> table1 = List<String>.from(value['action1']);
      List<String> table2 = List<String>.from(value['action2']);

      ReturnObject result = consultOracle(
        table1: table1,
        table2: table2,
      );

      setState(() {
        line1 = result.line1;
        line2 = result.line2;
        line3 = null;
      });
    });
  }

  void getPlotTwist() {
    ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json')
        .then((value) {
      List<String> table1 = List<String>.from(value['elements']['plot_twist']);
      List<String> table2 = List<String>.from(value['elements']['plot_twist']);

      ReturnObject result = consultOracle(
        table1: table1,
        table2: table2,
      );

      setState(() {
        line1 = result.line1;
        line2 = result.line2;
        line3 = null;
      });
    });
  }
}

String consultTable(List<String> table) {
  int random = Random().nextInt(table.length);
  return table[random];
}

ReturnObject consultOracle(
    {required List<String> table1, List<String>? table2}) {
  String result1 = consultTable(table1);
  String result2 = table2 != null ? consultTable(table2) : '';

  return ReturnObject(
    line1: result1,
    line2: result2,
  );
}
