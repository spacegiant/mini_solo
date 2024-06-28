import 'dart:math';
import '../../data/app_settings_data.dart';

RollTableResult? getRandomTableResult(RandomTableEntry table) {
  int tally = 0;
  RollTableResult? result;
  var rows = table.rows;
  int weightsSum = getWeightSum(rows);

  int randomRoll = Random().nextInt(weightsSum);

  for (int i = 0; i < rows.length; i++) {
    tally += rows[i].weight!;
    bool resultFound = randomRoll < tally;

    if (resultFound) {
      // if
      if (rows[i].otherRandomTable != null) {
        print("OTHER RANDOM TABLE!");
      }
      // else
      result = RollTableResult(
          title: table.title,
          randomRoll: randomRoll,
          resultString: rows[i].label,
          totalEntries: weightsSum,
          isFavourite: false,
          weight: rows[i].weight ?? 0);

      break;
    }
  }

  return result;
}

int getWeightSum(List<RandomTableRow> rows) {
  int weightsSum = 0;
  for (int i = 0; i < rows.length; i++) {
    weightsSum += rows[i].weight!;
  }
  return weightsSum;
}
