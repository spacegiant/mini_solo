import '../../icons.dart';
import 'dice.dart';

DiceType fate = DiceType(
  label: 'dF',
  faces: [
    DiceFace(value: -1, label: '-', icon: Images.fateMinus),
    DiceFace(value: 0, label: ' ', icon: Images.fateBlank),
    DiceFace(value: 1, label: '+', icon: Images.fatePlus),
  ],
  icon: Images.fateDice,
);
