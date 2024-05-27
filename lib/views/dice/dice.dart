import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../../data/campaign_data.dart';
import '../../icons.dart';

class DiceFace {
  late int value;
  late String? label;
  late Images icon;

  DiceFace({
    required this.value,
    this.label,
    required this.icon,
  });
}

class DiceSet {
  List<DiceType> dieTypes;
  String label;

  DiceSet({
    required this.dieTypes,
    required this.label,
  });
}

class DiceType {
  final Color? color;
  final String label;
  final List<DiceFace> faces;
  final Images icon;

  DiceType({
    this.color,
    required this.label,
    required this.faces,
    required this.icon,
  });

  BothResults roll() {
    int numberOfSides = faces.length;
    int rolledValue = Random().nextInt(numberOfSides);
    return BothResults(
      rolledValue: rolledValue + 1,
      label: faces[rolledValue].label,
    );
  }
}

// List<DiceFace> createDice(int numberOfSides) {
//   return List.generate(
//       numberOfSides,
//       (index) => DiceFace(
//             value: index,
//             label: (index + 1).toString(),
//             icon: Images.d2_1,
//           ));
// }
