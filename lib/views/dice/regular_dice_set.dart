import 'dice.dart';
import 'dice_view.dart';

DiceSet regularDice = DiceSet(
  dieTypes: [d4, d6, d8, d10, d12, d20, d100],
  label: 'Regular Dice Set',
);

DieType d4 = DieType(
  label: 'd4',
  faces: createDice(4),
);

DieType d6 = DieType(
  label: 'd6',
  faces: createDice(6),
);

DieType d8 = DieType(
  label: 'd8',
  faces: createDice(8),
);

DieType d10 = DieType(
  label: 'd10',
  faces: createDice(10),
);

DieType d12 = DieType(
  label: 'd12',
  faces: createDice(12),
);

DieType d20 = DieType(
  label: 'd20',
  faces: createDice(20),
);

DieType d100 = DieType(
  label: 'd100',
  faces: createDice(100),
);
