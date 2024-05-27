import '../../icons.dart';
import 'dice.dart';

DiceType fate = DiceType(
  label: 'dF',
  faces: [
    DiceFace(value: -1, label: '-', icon: Images.placeholder),
    DiceFace(value: 0, label: ' ', icon: Images.placeholder),
    DiceFace(value: 1, label: '+', icon: Images.placeholder),
  ],
  icon: Images.placeholder,
);
