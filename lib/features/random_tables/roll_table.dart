import 'dart:math';

import 'package:mini_solo/features/random_tables/roll_table_result.dart';

import '../../data/app_settings_data.dart';

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
