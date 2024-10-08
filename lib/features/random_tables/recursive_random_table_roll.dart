import 'dart:math';

import '../../data/app_settings_data.dart';

void recursiveRandomTableRoll({
  required int recursionLimit,
  required List<RandomTable> randomTables,
  required String randomTableId,
  required Function(RollTableResult) cb,
  String stringBuilder = '',
}) {
  // get random table
  int tally = 0;
  RandomTable randomTable =
      randomTables.firstWhere((table) => table.id == randomTableId);
  int weightsSum = getWeightSum(randomTable.rows);
  int randomRoll = Random().nextInt(weightsSum);
  RollTableResult? result;

  for (int i = 0; i < randomTable.rows.length; i++) {
    tally += randomTable.rows[i].weight!;
    bool resultFound = randomRoll < tally;

    if (resultFound) {
      if (randomTable.rows[i].otherRandomTable != null) {
        String? id = randomTable.rows[i].otherRandomTable;

        if (id == null) return;

        if (recursionLimit == 0) {
          print('HIT RECURSION LIMIT at ${randomTable.title}');
          return;
        }

        recursiveRandomTableRoll(
          recursionLimit: recursionLimit--,
          randomTables: randomTables,
          randomTableId: id,
          cb: cb,
          stringBuilder: '$stringBuilder ${randomTable.rows[i].label}',
        );
      } else {
        result = RollTableResult(
          title: randomTable.title,
          randomRoll: randomRoll,
          resultString: randomTable.rows[i].label,
          totalEntries: weightsSum,
          weight: randomTable.rows[i].weight ?? 1,
          detail: stringBuilder,
        );
      }

      break;
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
