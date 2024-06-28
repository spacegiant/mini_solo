import 'dart:math';

import '../../data/app_settings_data.dart';

void recursiveRandomTableRoll({
  required int recursionLimit,
  required List<RandomTableEntry> randomTables,
  required String randomTableId,
  required Function(RollTableResult) cb,
}) {
  // get random table
  int tally = 0;
  RandomTableEntry randomTable =
      randomTables.firstWhere((table) => table.id == randomTableId);
  int weightsSum = getWeightSum(randomTable.rows);
  int randomRoll = Random().nextInt(weightsSum);
  RollTableResult? result;

  if (randomTable.isRandomTable == true) {
    for (int i = 0; i < randomTable.rows.length; i++) {
      tally += randomTable.rows[i].weight!;
      bool resultFound = randomRoll < tally;

      if (resultFound) {
        // print(randomTable.rows[i].label);
        if (randomTable.rows[i].otherRandomTable != null) {
          String? id = randomTable.rows[i].otherRandomTable;

          if (id == null) return;

          if (recursionLimit == 0) {
            print(randomTable.title);
            print('HIT RECURSION LIMIT');
            return;
          }

          recursiveRandomTableRoll(
            recursionLimit: recursionLimit - 1,
            randomTables: randomTables,
            randomTableId: id,
            cb: cb,
          );
        }

        result = RollTableResult(
          title: randomTable.title,
          randomRoll: randomRoll,
          resultString: randomTable.rows[i].label,
          totalEntries: weightsSum,
          weight: randomTable.rows[i].weight ?? 1,
        );

        break;
      }
    }
  } else {
    for (int i = 0; i < randomTable.rows.length; i++) {
      if (randomTable.rows[i].otherRandomTable != null) {
        String? id = randomTable.rows[i].otherRandomTable;

        if (id == null) return;

        if (recursionLimit == 0) {
          print('HIT RECURSION LIMIT');
          return;
        }

        recursiveRandomTableRoll(
          recursionLimit: recursionLimit - 1,
          randomTables: randomTables,
          randomTableId: id,
          cb: cb,
        );
      }

      // break;
    }
  }

  if (result != null) cb(result);
}

int getWeightSum(List<RandomTableRow> rows) {
  int weightsSum = 0;
  for (int i = 0; i < rows.length; i++) {
    weightsSum += rows[i].weight!;
  }
  return weightsSum;
}
