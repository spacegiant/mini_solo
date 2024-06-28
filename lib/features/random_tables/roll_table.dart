import 'dart:math';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';

List<RollTableResult> getRandomTableResult({
  required String tableId,
  required AppState appState,
}) {
  List<RollTableResult> rollTableResults = [];

  void addToResultString(RollTableResult result) {
    rollTableResults.add(result);
  }

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

    for (int i = 0; i < randomTable.rows.length; i++) {
      tally += randomTable.rows[i].weight!;
      bool resultFound = randomRoll < tally;

      if (resultFound) {
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
        // else
        result = RollTableResult(
          title: randomTable.title,
          randomRoll: randomRoll,
          resultString: randomTable.rows[i].label,
          totalEntries: weightsSum,
          isFavourite: false,
          weight: randomTable.rows[i].weight ?? 0,
        );

        break;
      }
    }

    if (result != null) cb(result);
  }

  recursiveRandomTableRoll(
    recursionLimit:
        appState.campaignData?.settings.general.randomTableRecursionLimit ?? 3,
    randomTables: appState.randomTables,
    randomTableId: tableId,
    cb: addToResultString,
  );

  return rollTableResults;
}

int getWeightSum(List<RandomTableRow> rows) {
  int weightsSum = 0;
  for (int i = 0; i < rows.length; i++) {
    weightsSum += rows[i].weight!;
  }
  return weightsSum;
}
