import 'dice.dart';
import 'dice_view.dart';

DiceSet zocchiDice = DiceSet(
  dieTypes: [d3, d5, d7, d14, d16, d24, d30],
  label: 'Zocchi Dice Set',
);

DieType d3 = DieType(
  label: 'd3',
  faces: createDice(3),
);

DieType d5 = DieType(
  label: 'd5',
  faces: createDice(5),
);

DieType d7 = DieType(
  label: 'd7',
  faces: createDice(7),
);

DieType d14 = DieType(
  label: 'd14',
  faces: createDice(14),
);

DieType d16 = DieType(
  label: 'd16',
  faces: createDice(16),
);

DieType d24 = DieType(
  label: 'd24',
  faces: createDice(24),
);

DieType d30 = DieType(
  label: 'd30',
  faces: createDice(30),
);
