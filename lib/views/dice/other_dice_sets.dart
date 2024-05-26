import 'dice.dart';

DiceType coriolis = DiceType(
  label: 'Coriolis',
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '🪲'),
  ],
);

DiceType d6oracle = DiceType(
  label: 'D6 Oracle',
  faces: [
    DiceFace(value: 1, label: 'No +'),
    DiceFace(value: 2, label: 'No'),
    DiceFace(value: 3, label: 'No -'),
    DiceFace(value: 4, label: 'Yes +'),
    DiceFace(value: 5, label: 'Yes'),
    DiceFace(value: 6, label: 'Yes -'),
  ],
);
