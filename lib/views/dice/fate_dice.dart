import '../../svg_icon.dart';
import 'dice.dart';

DiceType fate = DiceType(
  label: 'dF',
  faces: [
    DiceFace(value: -1, label: '-', icon: SVGIcon.fateMinus),
    DiceFace(value: 0, label: ' ', icon: SVGIcon.fateBlank),
    DiceFace(value: 1, label: '+', icon: SVGIcon.fatePlus),
  ],
  icon: SVGIcon.fateDice,
);
