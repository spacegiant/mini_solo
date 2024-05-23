import '../data/campaign_data.dart';
import 'consult_table.dart';

ReturnObject consultOracle(
    {required List<String> table1,
    List<String>? table2,
    required String type}) {
  String result1 = consultTable(table1);
  String result2 = table2 != null ? consultTable(table2) : '';

  return ReturnObject(
    result: '$result1 $result2',
    type: type,
  );
}
