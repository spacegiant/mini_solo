import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiceFace {
  late int value;
  late String? label;
  late Icon? icon;

  DiceFace({
    required this.value,
    this.label,
    this.icon,
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
  final bool? isZocchi;

  DiceType({
    this.color,
    required this.label,
    required this.faces,
    this.isZocchi,
  });

  BothResults roll() {
    int numberOfSides = faces.length;
    int rolledValue = Random().nextInt(numberOfSides);
    print(faces[0].label);
    return BothResults(
      rolledValue: rolledValue + 1,
      label: faces[rolledValue].label,
    );
  }
}

class BothResults {
  final int rolledValue;
  final String? label;

  BothResults({
    required this.rolledValue,
    this.label,
  });
}

List<DiceFace> createDice(int numberOfSides) {
  return List.generate(numberOfSides,
      (index) => DiceFace(value: index, label: index.toString()));
}
