import 'dart:math';

// TODO: COMPLETE FATE DICE - NEEDS 4 ROLLS AND A TOTAL
import 'dice.dart';

DiceType fate = DiceType(
  label: 'dF',
  faces: [
    DiceFace(value: -1, label: '-'),
    DiceFace(value: 0, label: ' '),
    DiceFace(value: 1, label: '+'),
  ],
);
