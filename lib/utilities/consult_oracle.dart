import '../views/journal_view.dart';
import 'consult_table.dart';

ReturnObject consultOracle(
    {required List<String> table1, List<String>? table2}) {
  String result1 = consultTable(table1);
  String result2 = table2 != null ? consultTable(table2) : '';

  return ReturnObject(
    line1: result1,
    line2: result2,
  );
}
