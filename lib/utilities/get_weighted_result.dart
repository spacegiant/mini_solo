import 'dart:math';

import 'package:mini_solo/utilities/read_json_file.dart';

getWeightedResult(
  String path,
  void Function(String) callback,
) {
  ReadJsonFile.readJsonData(path: path).then((value) {
    List<dynamic> weightedTable = value['event_focus'];
    int weightsSum = 0;
    for (var i = 0; i < weightedTable.length; i++) {
      weightsSum += weightedTable[i]['weight'] as int;
    }

    // Get random number between 0 and weightSum
    int randomRoll = Random().nextInt(weightsSum - 1);

    // Find the item in the list that corresponds with the random number
    int tally = 0;
    for (var j = 0; j < weightedTable.length; j++) {
      tally += weightedTable[j]['weight'] as int;
      if (randomRoll < tally) {
        callback(weightedTable[j]['text']);
        return;
      }
    }
  });
}
