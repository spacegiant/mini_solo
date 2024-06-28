import 'package:mini_solo/features/random_tables/recursive_random_table_roll.dart';

import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';

List<RollTableResult> getRandomTableResult({
  required String tableId,
  required AppState appState,
}) {
  List<RollTableResult> rollTableResults = [];

  void addToResultList(RollTableResult result) {
    rollTableResults.add(result);
  }

  recursiveRandomTableRoll(
    recursionLimit:
        appState.campaignData?.settings.general.randomTableRecursionLimit ?? 3,
    randomTables: appState.randomTables,
    randomTableId: tableId,
    cb: addToResultList,
  );

  return rollTableResults;
}
