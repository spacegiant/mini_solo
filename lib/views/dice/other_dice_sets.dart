import '../../icons.dart';
import 'dice.dart';

DiceType coriolis = DiceType(
  label: 'Coriolis',
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.coriolis1),
    DiceFace(value: 2, label: '2', icon: SVGIcon.coriolis2),
    DiceFace(value: 3, label: '3', icon: SVGIcon.coriolis3),
    DiceFace(value: 4, label: '4', icon: SVGIcon.coriolis4),
    DiceFace(value: 5, label: '5', icon: SVGIcon.coriolis5),
    DiceFace(value: 6, label: '6', icon: SVGIcon.coriolis6),
  ],
  icon: SVGIcon.placeholder,
);

DiceType d6oracle = DiceType(
  label: 'Oracle',
  faces: [
    DiceFace(value: 1, label: 'No +', icon: SVGIcon.d6OracleNoAnd),
    DiceFace(value: 2, label: 'No', icon: SVGIcon.d6OracleNo),
    DiceFace(value: 3, label: 'No -', icon: SVGIcon.d6OracleNoBut),
    DiceFace(value: 4, label: 'Yes +', icon: SVGIcon.d6OracleYesAnd),
    DiceFace(value: 5, label: 'Yes', icon: SVGIcon.d6OracleYes),
    DiceFace(value: 6, label: 'Yes -', icon: SVGIcon.d6OracleYesBut),
  ],
  icon: SVGIcon.placeholder,
);
