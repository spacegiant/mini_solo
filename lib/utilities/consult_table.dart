import 'dart:math';

String consultTable(List<String> table) {
  int random = Random().nextInt(table.length);
  return table[random];
}
