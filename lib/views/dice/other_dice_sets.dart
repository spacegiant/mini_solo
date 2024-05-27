import '../../icons.dart';
import 'dice.dart';

DiceType coriolis = DiceType(
  label: 'Coriolis',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.coriolis1),
    DiceFace(value: 2, label: '2', icon: Images.coriolis2),
    DiceFace(value: 3, label: '3', icon: Images.coriolis3),
    DiceFace(value: 4, label: '4', icon: Images.coriolis4),
    DiceFace(value: 5, label: '5', icon: Images.coriolis5),
    DiceFace(value: 6, label: '6', icon: Images.coriolis6),
  ],
  icon: Images.placeholder,
);

DiceType d6oracle = DiceType(
  label: 'Oracle',
  faces: [
    DiceFace(value: 1, label: 'No +', icon: Images.d6OracleNoAnd),
    DiceFace(value: 2, label: 'No', icon: Images.d6OracleNo),
    DiceFace(value: 3, label: 'No -', icon: Images.d6OracleNoBut),
    DiceFace(value: 4, label: 'Yes +', icon: Images.d6OracleYesAnd),
    DiceFace(value: 5, label: 'Yes', icon: Images.d6OracleYes),
    DiceFace(value: 6, label: 'Yes -', icon: Images.d6OracleYesBut),
  ],
  icon: Images.placeholder,
);
