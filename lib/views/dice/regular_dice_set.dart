import 'dice.dart';

DiceSet regularDice = DiceSet(
  dieTypes: [d4, d6, d8, d10, d12, d20, d100],
  label: 'Regular Dice Set',
);

DiceSet zocchiDice = DiceSet(
  dieTypes: [d3, d5, d7, d14, d16, d24, d30],
  label: 'Zocchi Dice Set',
);

DiceSet all = DiceSet(
  dieTypes: [d3, d4, d5, d6, d7, d8, d10, d12, d14, d16, d20, d24, d30, d100],
  label: 'Regular + Zocchi Dice Set',
);

DieType d4 = DieType(
  isZocchi: false,
  label: 'd4',
  faces: createDice(4),
);

DieType d6 = DieType(
  isZocchi: false,
  label: 'd6',
  faces: createDice(6),
);

DieType d8 = DieType(
  isZocchi: false,
  label: 'd8',
  faces: createDice(8),
);

DieType d10 = DieType(
  isZocchi: false,
  label: 'd10',
  faces: createDice(10),
);

DieType d12 = DieType(
  isZocchi: false,
  label: 'd12',
  faces: createDice(12),
);

DieType d20 = DieType(
  isZocchi: false,
  label: 'd20',
  faces: createDice(20),
);

DieType d100 = DieType(
  isZocchi: false,
  label: 'd100',
  faces: createDice(100),
);

// ZOCCHI DICE

DieType d3 = DieType(
  isZocchi: true,
  label: 'd3',
  faces: createDice(3),
);

DieType d5 = DieType(
  isZocchi: true,
  label: 'd5',
  faces: createDice(5),
);

DieType d7 = DieType(
  isZocchi: true,
  label: 'd7',
  faces: createDice(7),
);

DieType d14 = DieType(
  isZocchi: true,
  label: 'd14',
  faces: createDice(14),
);

DieType d16 = DieType(
  isZocchi: true,
  label: 'd16',
  faces: createDice(16),
);

DieType d24 = DieType(
  isZocchi: true,
  label: 'd24',
  faces: createDice(24),
);

DieType d30 = DieType(
  isZocchi: true,
  label: 'd30',
  faces: createDice(30),
);
