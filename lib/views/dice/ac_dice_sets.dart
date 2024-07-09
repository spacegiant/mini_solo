import '../../svg_icon.dart';
import 'dice.dart';

DiceSet acDice =
    DiceSet(dieTypes: [d6, d20], label: 'Achtung! Cthulhu Dice Set');

DiceType d6 = DiceType(
  label: 'A!C d6',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.acD6_123),
    DiceFace(value: 2, icon: SVGIcon.acD6_123),
    DiceFace(value: 3, icon: SVGIcon.acD6_123),
    DiceFace(value: 4, icon: SVGIcon.acD6_4),
    DiceFace(value: 5, icon: SVGIcon.acD6_5),
    DiceFace(value: 6, icon: SVGIcon.acD6_6),
  ],
  icon: SVGIcon.acD6_6,
);

DiceType d20 = DiceType(
  label: 'A!C d20',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.acD20_1),
    DiceFace(value: 2, icon: SVGIcon.acD20_2),
    DiceFace(value: 3, icon: SVGIcon.acD20_3),
    DiceFace(value: 4, icon: SVGIcon.acD20_4),
    DiceFace(value: 5, icon: SVGIcon.acD20_5),
    DiceFace(value: 6, icon: SVGIcon.acD20_6),
    DiceFace(value: 7, icon: SVGIcon.acD20_7),
    DiceFace(value: 8, icon: SVGIcon.acD20_8),
    DiceFace(value: 9, icon: SVGIcon.acD20_9),
    DiceFace(value: 10, icon: SVGIcon.acD20_10),
    DiceFace(value: 11, icon: SVGIcon.acD20_11),
    DiceFace(value: 12, icon: SVGIcon.acD20_12),
    DiceFace(value: 13, icon: SVGIcon.acD20_13),
    DiceFace(value: 14, icon: SVGIcon.acD20_14),
    DiceFace(value: 15, icon: SVGIcon.acD20_15),
    DiceFace(value: 16, icon: SVGIcon.acD20_16),
    DiceFace(value: 17, icon: SVGIcon.acD20_17),
    DiceFace(value: 18, icon: SVGIcon.acD20_18),
    DiceFace(value: 19, icon: SVGIcon.acD20_19),
    DiceFace(value: 20, icon: SVGIcon.acD20_20),
  ],
  icon: SVGIcon.acD20_20,
);
