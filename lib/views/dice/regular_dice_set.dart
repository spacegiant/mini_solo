import '../../icons.dart';
import 'dice.dart';

DiceSet regularDice = DiceSet(
  dieTypes: [d4, d6, d8, d10, d12, d20, d100],
  label: 'Regular Dice Set',
);

DiceSet zocchiDice = DiceSet(
  dieTypes: [d2, d3, d5, d7, d14, d16, d24, d30],
  label: 'Zocchi Dice Set',
);

DiceSet all = DiceSet(
  dieTypes: [
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    d8,
    d10,
    d12,
    d14,
    d16,
    d20,
    d24,
    d30,
    d100
  ],
  label: 'Regular + Zocchi Dice Set',
);

DiceType d4 = DiceType(
  icon: Images.d4_4,
  label: 'd4',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d4_1),
    DiceFace(value: 2, label: '2', icon: Images.d4_2),
    DiceFace(value: 3, label: '3', icon: Images.d4_3),
    DiceFace(value: 4, label: '4', icon: Images.d4_4),
  ],
);

DiceType d6 = DiceType(
  icon: Images.placeholder,
  label: 'd6',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d8 = DiceType(
  icon: Images.placeholder,
  label: 'd8',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d10 = DiceType(
  icon: Images.placeholder,
  label: 'd10',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d12 = DiceType(
  icon: Images.placeholder,
  label: 'd12',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d20 = DiceType(
  icon: Images.placeholder,
  label: 'd20',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d100 = DiceType(
  icon: Images.placeholder,
  label: 'd100',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

// ZOCCHI DICE

DiceType d2 = DiceType(
  icon: Images.d2_2,
  label: 'd2',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d2_1),
    DiceFace(value: 2, label: '2', icon: Images.d2_2),
  ],
);

DiceType d3 = DiceType(
  icon: Images.d3_3,
  label: 'd3',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d3_1),
    DiceFace(value: 2, label: '2', icon: Images.d3_2),
    DiceFace(value: 2, label: '2', icon: Images.d3_3),
  ],
);

DiceType d5 = DiceType(
  icon: Images.d5_5,
  label: 'd5',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d5_1),
    DiceFace(value: 2, label: '2', icon: Images.d5_2),
    DiceFace(value: 3, label: '3', icon: Images.d5_3),
    DiceFace(value: 4, label: '4', icon: Images.d5_4),
    DiceFace(value: 5, label: '5', icon: Images.d5_5),
  ],
);

DiceType d7 = DiceType(
  icon: Images.placeholder,
  label: 'd7',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d14 = DiceType(
  icon: Images.placeholder,
  label: 'd14',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d16 = DiceType(
  icon: Images.placeholder,
  label: 'd16',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d24 = DiceType(
  icon: Images.placeholder,
  label: 'd24',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);

DiceType d30 = DiceType(
  icon: Images.placeholder,
  label: 'd30',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
  ],
);
