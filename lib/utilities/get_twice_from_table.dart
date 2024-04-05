import 'package:mini_solo/utilities/read_json_file.dart';

import '../views/journal_view.dart';
import 'app_state.dart';
import 'consult_oracle.dart';

void getTwiceFromTable(
  AppState appState,
  String tablePath,
  String label,
  String table1,
  String? table2,
  Function(
    AppState appState,
    ReturnObject result,
    String label,
  ) onResult,
) {
  ReadJsonFile.readJsonData(path: 'lib/assets/json/$tablePath').then((value) {
    List<String> table1 = List<String>.from(value['table']);
    List<String> table2 = List<String>.from(value['table']);

    ReturnObject result = consultOracle(
      table1: table1,
      table2: table2,
    );

    onResult(appState, result, label);
  });
}
