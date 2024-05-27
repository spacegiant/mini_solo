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
  isZocchi: false,
  label: 'd4',
  faces: createDice(4),
);

DiceType d6 = DiceType(
  isZocchi: false,
  label: 'd6',
  faces: createDice(6),
);

DiceType d8 = DiceType(
  isZocchi: false,
  label: 'd8',
  faces: createDice(8),
);

DiceType d10 = DiceType(
  isZocchi: false,
  label: 'd10',
  faces: createDice(10),
);

DiceType d12 = DiceType(
  isZocchi: false,
  label: 'd12',
  faces: createDice(12),
);

DiceType d20 = DiceType(
  isZocchi: false,
  label: 'd20',
  faces: createDice(20),
);

DiceType d100 = DiceType(
  isZocchi: false,
  label: 'd100',
  faces: createDice(100),
);

// ZOCCHI DICE

DiceType d2 = DiceType(
  isZocchi: true,
  label: 'd2',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d2_1),
    DiceFace(value: 2, label: '2', icon: Images.d2_2),
  ],
);

DiceType d3 = DiceType(
  isZocchi: true,
  label: 'd3',
  faces: createDice(3),
);

DiceType d5 = DiceType(
  isZocchi: true,
  label: 'd5',
  faces: createDice(5),
);

DiceType d7 = DiceType(
  isZocchi: true,
  label: 'd7',
  faces: createDice(7),
);

DiceType d14 = DiceType(
  isZocchi: true,
  label: 'd14',
  faces: createDice(14),
);

DiceType d16 = DiceType(
  isZocchi: true,
  label: 'd16',
  faces: createDice(16),
);

DiceType d24 = DiceType(
  isZocchi: true,
  label: 'd24',
  faces: createDice(24),
);

DiceType d30 = DiceType(
  isZocchi: true,
  label: 'd30',
  faces: createDice(30),
);
