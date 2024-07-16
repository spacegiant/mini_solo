import 'package:mini_solo/utilities/read_json_file.dart';

import '../data/app_state.dart';
import '../data/data_structures/journal_entry.dart';
import 'consult_oracle.dart';

getRandomResult({
  required AppState appState,
  required String label,
  required String jsonPath,
  required String table1,
  required String? table2,
  required Function(
    AppState appState,
    JournalEntry result,
    String label,
  ) onResult,
}) {
  ReadJsonFile.readJsonData(path: 'lib/assets/json/$jsonPath').then((value) {
    List<String> t1 = List<String>.from(value[table1]);
    List<String> t2 = List<String>.from(value[table2]);

    JournalEntry result = consultOracle(
      table1: t1,
      table2: t2,
      type: label,
    );

    onResult(appState, result, label);
  });
}
