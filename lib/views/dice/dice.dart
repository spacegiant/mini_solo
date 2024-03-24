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
  List<DieType> dieTypes;
  String label;

  DiceSet({
    required this.dieTypes,
    required this.label,
  });
}

class DieType {
  final Color? color;
  final String label;
  final List<DiceFace> faces;
  final bool isZocchi;

  DieType({
    this.color,
    required this.label,
    required this.faces,
    required this.isZocchi,
  });

  int roll() {
    int numberOfSides = faces.length;
    int randomRoll = Random().nextInt(numberOfSides) + 1;
    return randomRoll;
  }
}

List<DiceFace> createDice(int numberOfSides) {
  return List.generate(numberOfSides,
      (index) => DiceFace(value: index, label: index.toString()));
}
