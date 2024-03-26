import 'package:mini_solo/utilities/read_json_file.dart';

import '../views/journal_view.dart';
import 'app_state.dart';
import 'consult_oracle.dart';

void getTwiceFromTable(
  AppState appState,
  String tableName,
  String label,
  Function(
    AppState appState,
    ReturnObject result,
    String label,
  ) onResult,
) {
  ReadJsonFile.readJsonData(path: 'lib/assets/json/mythic.json').then((value) {
    List<String> table1 = List<String>.from(value['elements'][tableName]);
    List<String> table2 = List<String>.from(value['elements'][tableName]);

    ReturnObject result = consultOracle(
      table1: table1,
      table2: table2,
    );

    onResult(appState, result, label);
  });
}
