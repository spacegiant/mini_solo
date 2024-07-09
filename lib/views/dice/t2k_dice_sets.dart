import '../../svg_icon.dart';
import 'dice.dart';

DiceSet t2kDice =
    DiceSet(dieTypes: [ammo, d6, d8, d10, d12, body], label: 'T2000 Dice Set');

DiceType ammo = DiceType(
  label: 'T2K Ammo',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kAmmo_1),
    DiceFace(value: 2, icon: SVGIcon.t2kAmmo_2),
    DiceFace(value: 3, icon: SVGIcon.t2kAmmo_3),
    DiceFace(value: 4, icon: SVGIcon.t2kAmmo_4),
    DiceFace(value: 5, icon: SVGIcon.t2kAmmo_5),
    DiceFace(value: 6, icon: SVGIcon.t2kAmmo_6),
  ],
  icon: SVGIcon.t2kAmmo_6,
);

DiceType d6 = DiceType(
  label: 'T2K d6',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kD6_1),
    DiceFace(value: 2, icon: SVGIcon.t2kD6_2),
    DiceFace(value: 3, icon: SVGIcon.t2kD6_3),
    DiceFace(value: 4, icon: SVGIcon.t2kD6_4),
    DiceFace(value: 5, icon: SVGIcon.t2kD6_5),
    DiceFace(value: 6, icon: SVGIcon.t2kD6_6),
  ],
  icon: SVGIcon.t2kD6_6,
);

DiceType d8 = DiceType(
  label: 'T2K d8',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kD8_1),
    DiceFace(value: 2, icon: SVGIcon.t2kD8_2),
    DiceFace(value: 3, icon: SVGIcon.t2kD8_3),
    DiceFace(value: 4, icon: SVGIcon.t2kD8_4),
    DiceFace(value: 5, icon: SVGIcon.t2kD8_5),
    DiceFace(value: 6, icon: SVGIcon.t2kD8_6),
    DiceFace(value: 7, icon: SVGIcon.t2kD8_7),
    DiceFace(value: 8, icon: SVGIcon.t2kD8_8),
  ],
  icon: SVGIcon.t2kD8_8,
);

DiceType d10 = DiceType(
  label: 'T2K d10',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kD10_1),
    DiceFace(value: 2, icon: SVGIcon.t2kD10_2),
    DiceFace(value: 3, icon: SVGIcon.t2kD10_3),
    DiceFace(value: 4, icon: SVGIcon.t2kD10_4),
    DiceFace(value: 5, icon: SVGIcon.t2kD10_5),
    DiceFace(value: 6, icon: SVGIcon.t2kD10_6),
    DiceFace(value: 7, icon: SVGIcon.t2kD10_7),
    DiceFace(value: 8, icon: SVGIcon.t2kD10_8),
    DiceFace(value: 9, icon: SVGIcon.t2kD10_9),
    DiceFace(value: 10, icon: SVGIcon.t2kD10_10),
  ],
  icon: SVGIcon.t2kD10_10,
);

DiceType d12 = DiceType(
  label: 'T2K d12',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kD12_1),
    DiceFace(value: 2, icon: SVGIcon.t2kD12_2),
    DiceFace(value: 3, icon: SVGIcon.t2kD12_3),
    DiceFace(value: 4, icon: SVGIcon.t2kD12_4),
    DiceFace(value: 5, icon: SVGIcon.t2kD12_5),
    DiceFace(value: 6, icon: SVGIcon.t2kD12_6),
    DiceFace(value: 7, icon: SVGIcon.t2kD12_7),
    DiceFace(value: 8, icon: SVGIcon.t2kD12_8),
    DiceFace(value: 9, icon: SVGIcon.t2kD12_9),
    DiceFace(value: 10, icon: SVGIcon.t2kD12_10),
    DiceFace(value: 11, icon: SVGIcon.t2kD12_11),
    DiceFace(value: 12, icon: SVGIcon.t2kD12_12),
  ],
  icon: SVGIcon.t2kD12_12,
);

DiceType body = DiceType(
  label: 'T2K body',
  faces: [
    DiceFace(value: 1, icon: SVGIcon.t2kBody_1),
    DiceFace(value: 2, icon: SVGIcon.t2kBody_2),
    DiceFace(value: 3, icon: SVGIcon.t2kBody_3),
    DiceFace(value: 4, icon: SVGIcon.t2kBody_4),
    DiceFace(value: 5, icon: SVGIcon.t2kBody_5),
    DiceFace(value: 6, icon: SVGIcon.t2kBody_6),
  ],
  icon: SVGIcon.t2kBody_1,
);
