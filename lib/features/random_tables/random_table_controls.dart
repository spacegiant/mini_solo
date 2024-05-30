import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../data/app_state.dart';

class RandomTables extends StatelessWidget {
  const RandomTables({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    List<RandomTableEntry> randomTables = appState.randomTables;
    return WrapManager(
      wrapControls: appState.wrapControls,
      children: [
        ...randomTables.map((table) => ListButton(
            label: table.title,
            onPressed: () {
              String test = rollTable(table).resultString;
              print(test);
              // TODO: Send to JOurnal
            })),
        CupertinoButton(
            child: const Icon(
              CupertinoIcons.add_circled_solid,
            ),
            onPressed: () {
              appState.toggleShowPopup(
                label: PopupLabels.addRandomTable,
              );
            }),
      ],
    );
  }
}

RollTableResult rollTable(RandomTableEntry table) {
  int weightsSum = 0;
  int tally = 0;
  RollTableResult result = RollTableResult(
      randomRoll: 0, resultString: '', lowerBounds: 0, upperBounds: 0);
  var rows = table.rows;

  for (int i = 0; i < rows.length; i++) {
    weightsSum += rows[i].chance!;
  }

  int randomRoll = Random().nextInt(weightsSum);

  for (int i = 0; i < rows.length; i++) {
    tally += rows[i].chance!;

    if (randomRoll < tally) {
      result = RollTableResult(
          randomRoll: randomRoll,
          resultString: rows[i].title,
          lowerBounds: tally,
          upperBounds: rows[i].chance ?? 0);

      break;
    }
  }

  return result;
}

class RollTableResult {
  int randomRoll;
  String resultString;
  int lowerBounds;
  int upperBounds;

  RollTableResult({
    required this.randomRoll,
    required this.resultString,
    required this.lowerBounds,
    required this.upperBounds,
  });
}
