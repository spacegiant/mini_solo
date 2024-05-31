import 'dart:math';
import '../../data/app_settings_data.dart';

RollTableResult? rollTable(RandomTableEntry table) {
  int weightsSum = 0;
  int tally = 0;
  RollTableResult? result;
  var rows = table.rows;

  for (int i = 0; i < rows.length; i++) {
    weightsSum += rows[i].weight!;
  }

  int randomRoll = Random().nextInt(weightsSum);

  for (int i = 0; i < rows.length; i++) {
    tally += rows[i].weight!;

    if (randomRoll < tally) {
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
