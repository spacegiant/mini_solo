import '../../icons.dart';
import 'dice.dart';

DiceSet regularDice = DiceSet(
  dieTypes: [d4, d6, d8, d10, d100, d12, d20],
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
    d100,
    d12,
    d14,
    d16,
    d20,
    d24,
    d30,
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
  icon: Images.d6_6,
  label: 'd6',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d6_1),
    DiceFace(value: 2, label: '2', icon: Images.d6_2),
    DiceFace(value: 3, label: '3', icon: Images.d6_3),
    DiceFace(value: 4, label: '4', icon: Images.d6_4),
    DiceFace(value: 5, label: '5', icon: Images.d6_5),
    DiceFace(value: 6, label: '6', icon: Images.d6_6),
  ],
);

DiceType d8 = DiceType(
  icon: Images.d8_8,
  label: 'd8',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d8_1),
    DiceFace(value: 2, label: '2', icon: Images.d8_2),
    DiceFace(value: 3, label: '3', icon: Images.d8_3),
    DiceFace(value: 4, label: '4', icon: Images.d8_4),
    DiceFace(value: 5, label: '5', icon: Images.d8_5),
    DiceFace(value: 6, label: '6', icon: Images.d8_6),
    DiceFace(value: 7, label: '7', icon: Images.d8_7),
    DiceFace(value: 8, label: '8', icon: Images.d8_8),
  ],
);

DiceType d10 = DiceType(
  icon: Images.d10_10,
  label: 'd10',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d10_1),
    DiceFace(value: 2, label: '2', icon: Images.d10_2),
    DiceFace(value: 3, label: '3', icon: Images.d10_3),
    DiceFace(value: 4, label: '4', icon: Images.d10_4),
    DiceFace(value: 5, label: '5', icon: Images.d10_5),
    DiceFace(value: 6, label: '6', icon: Images.d10_6),
    DiceFace(value: 7, label: '7', icon: Images.d10_7),
    DiceFace(value: 8, label: '8', icon: Images.d10_8),
    DiceFace(value: 9, label: '9', icon: Images.d10_9),
    DiceFace(value: 10, label: '10', icon: Images.d10_10),
  ],
);

DiceType d12 = DiceType(
  icon: Images.d12_12,
  label: 'd12',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d12_1),
    DiceFace(value: 2, label: '2', icon: Images.d12_2),
    DiceFace(value: 3, label: '3', icon: Images.d12_3),
    DiceFace(value: 4, label: '4', icon: Images.d12_4),
    DiceFace(value: 5, label: '5', icon: Images.d12_5),
    DiceFace(value: 6, label: '6', icon: Images.d12_6),
    DiceFace(value: 7, label: '7', icon: Images.d12_7),
    DiceFace(value: 8, label: '8', icon: Images.d12_8),
    DiceFace(value: 9, label: '9', icon: Images.d12_9),
    DiceFace(value: 10, label: '10', icon: Images.d12_10),
    DiceFace(value: 11, label: '11', icon: Images.d12_11),
    DiceFace(value: 12, label: '12', icon: Images.d12_12),
  ],
);

DiceType d20 = DiceType(
  icon: Images.d20_20,
  label: 'd20',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d20_1),
    DiceFace(value: 2, label: '2', icon: Images.d20_2),
    DiceFace(value: 3, label: '3', icon: Images.d20_3),
    DiceFace(value: 4, label: '4', icon: Images.d20_4),
    DiceFace(value: 5, label: '5', icon: Images.d20_5),
    DiceFace(value: 6, label: '6', icon: Images.d20_6),
    DiceFace(value: 7, label: '7', icon: Images.d20_7),
    DiceFace(value: 8, label: '8', icon: Images.d20_8),
    DiceFace(value: 9, label: '9', icon: Images.d20_9),
    DiceFace(value: 10, label: '10', icon: Images.d20_10),
    DiceFace(value: 11, label: '11', icon: Images.d20_11),
    DiceFace(value: 12, label: '12', icon: Images.d20_12),
    DiceFace(value: 13, label: '13', icon: Images.d20_13),
    DiceFace(value: 14, label: '14', icon: Images.d20_14),
    DiceFace(value: 15, label: '15', icon: Images.d20_15),
    DiceFace(value: 16, label: '16', icon: Images.d20_16),
    DiceFace(value: 17, label: '17', icon: Images.d20_17),
    DiceFace(value: 18, label: '18', icon: Images.d20_18),
    DiceFace(value: 19, label: '19', icon: Images.d20_19),
    DiceFace(value: 20, label: '20', icon: Images.d20_20),
  ],
);

DiceType d100 = DiceType(
  icon: Images.d100_10,
  label: 'd100',
  faces: [
    DiceFace(value: 1, label: '10', icon: Images.d100_1),
    DiceFace(value: 2, label: '20', icon: Images.d100_2),
    DiceFace(value: 3, label: '30', icon: Images.d100_3),
    DiceFace(value: 4, label: '40', icon: Images.d100_4),
    DiceFace(value: 5, label: '50', icon: Images.d100_5),
    DiceFace(value: 6, label: '60', icon: Images.d100_6),
    DiceFace(value: 7, label: '70', icon: Images.d100_7),
    DiceFace(value: 8, label: '80', icon: Images.d100_8),
    DiceFace(value: 9, label: '90', icon: Images.d100_9),
    DiceFace(value: 10, label: '100', icon: Images.d100_10),
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
  icon: Images.d7_7,
  label: 'd7',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d7_1),
    DiceFace(value: 2, label: '2', icon: Images.d7_2),
    DiceFace(value: 3, label: '3', icon: Images.d7_3),
    DiceFace(value: 4, label: '4', icon: Images.d7_4),
    DiceFace(value: 5, label: '5', icon: Images.d7_5),
    DiceFace(value: 6, label: '6', icon: Images.d7_6),
    DiceFace(value: 7, label: '7', icon: Images.d7_7),
  ],
);

DiceType d14 = DiceType(
  icon: Images.d14_14,
  label: 'd14',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d14_1),
    DiceFace(value: 2, label: '2', icon: Images.d14_2),
    DiceFace(value: 3, label: '3', icon: Images.d14_3),
    DiceFace(value: 4, label: '4', icon: Images.d14_4),
    DiceFace(value: 5, label: '5', icon: Images.d14_5),
    DiceFace(value: 6, label: '6', icon: Images.d14_6),
    DiceFace(value: 7, label: '7', icon: Images.d14_7),
    DiceFace(value: 8, label: '8', icon: Images.d14_8),
    DiceFace(value: 9, label: '9', icon: Images.d14_9),
    DiceFace(value: 10, label: '10', icon: Images.d14_10),
    DiceFace(value: 11, label: '11', icon: Images.d14_11),
    DiceFace(value: 12, label: '12', icon: Images.d14_12),
    DiceFace(value: 13, label: '13', icon: Images.d14_13),
    DiceFace(value: 14, label: '14', icon: Images.d14_14),
  ],
);

DiceType d16 = DiceType(
  icon: Images.d16_16,
  label: 'd16',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d16_1),
    DiceFace(value: 2, label: '2', icon: Images.d16_2),
    DiceFace(value: 3, label: '3', icon: Images.d16_3),
    DiceFace(value: 4, label: '4', icon: Images.d16_4),
    DiceFace(value: 5, label: '5', icon: Images.d16_5),
    DiceFace(value: 6, label: '6', icon: Images.d16_6),
    DiceFace(value: 7, label: '7', icon: Images.d16_7),
    DiceFace(value: 8, label: '8', icon: Images.d16_8),
    DiceFace(value: 9, label: '9', icon: Images.d16_9),
    DiceFace(value: 10, label: '10', icon: Images.d16_10),
    DiceFace(value: 11, label: '11', icon: Images.d16_11),
    DiceFace(value: 12, label: '12', icon: Images.d16_12),
    DiceFace(value: 13, label: '13', icon: Images.d16_13),
    DiceFace(value: 14, label: '14', icon: Images.d16_14),
    DiceFace(value: 15, label: '15', icon: Images.d16_15),
    DiceFace(value: 16, label: '16', icon: Images.d16_16),
  ],
);

DiceType d24 = DiceType(
  icon: Images.d24_24,
  label: 'd24',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d24_1),
    DiceFace(value: 2, label: '2', icon: Images.d24_2),
    DiceFace(value: 3, label: '3', icon: Images.d24_3),
    DiceFace(value: 4, label: '4', icon: Images.d24_4),
    DiceFace(value: 5, label: '5', icon: Images.d24_5),
    DiceFace(value: 6, label: '6', icon: Images.d24_6),
    DiceFace(value: 7, label: '7', icon: Images.d24_7),
    DiceFace(value: 8, label: '8', icon: Images.d24_8),
    DiceFace(value: 9, label: '9', icon: Images.d24_9),
    DiceFace(value: 10, label: '10', icon: Images.d24_10),
    DiceFace(value: 11, label: '11', icon: Images.d24_11),
    DiceFace(value: 12, label: '12', icon: Images.d24_12),
    DiceFace(value: 13, label: '13', icon: Images.d24_13),
    DiceFace(value: 14, label: '14', icon: Images.d24_14),
    DiceFace(value: 15, label: '15', icon: Images.d24_15),
    DiceFace(value: 16, label: '16', icon: Images.d24_16),
    DiceFace(value: 17, label: '17', icon: Images.d24_17),
    DiceFace(value: 18, label: '18', icon: Images.d24_18),
    DiceFace(value: 19, label: '19', icon: Images.d24_19),
    DiceFace(value: 20, label: '20', icon: Images.d24_20),
    DiceFace(value: 21, label: '20', icon: Images.d24_21),
    DiceFace(value: 22, label: '20', icon: Images.d24_22),
    DiceFace(value: 23, label: '20', icon: Images.d24_23),
    DiceFace(value: 24, label: '20', icon: Images.d24_24),
  ],
);

DiceType d30 = DiceType(
  icon: Images.d30_30,
  label: 'd30',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.d30_1),
    DiceFace(value: 2, label: '2', icon: Images.d30_2),
    DiceFace(value: 3, label: '3', icon: Images.d30_3),
    DiceFace(value: 4, label: '4', icon: Images.d30_4),
    DiceFace(value: 5, label: '5', icon: Images.d30_5),
    DiceFace(value: 6, label: '6', icon: Images.d30_6),
    DiceFace(value: 7, label: '7', icon: Images.d30_7),
    DiceFace(value: 8, label: '8', icon: Images.d30_8),
    DiceFace(value: 9, label: '9', icon: Images.d30_9),
    DiceFace(value: 10, label: '10', icon: Images.d30_10),
    DiceFace(value: 11, label: '11', icon: Images.d30_11),
    DiceFace(value: 12, label: '12', icon: Images.d30_12),
    DiceFace(value: 13, label: '13', icon: Images.d30_13),
    DiceFace(value: 14, label: '14', icon: Images.d30_14),
    DiceFace(value: 15, label: '15', icon: Images.d30_15),
    DiceFace(value: 16, label: '16', icon: Images.d30_16),
    DiceFace(value: 17, label: '17', icon: Images.d30_17),
    DiceFace(value: 18, label: '18', icon: Images.d30_18),
    DiceFace(value: 19, label: '19', icon: Images.d30_19),
    DiceFace(value: 20, label: '20', icon: Images.d30_20),
    DiceFace(value: 21, label: '20', icon: Images.d30_21),
    DiceFace(value: 22, label: '20', icon: Images.d30_22),
    DiceFace(value: 23, label: '20', icon: Images.d30_23),
    DiceFace(value: 24, label: '20', icon: Images.d30_24),
    DiceFace(value: 25, label: '20', icon: Images.d30_25),
    DiceFace(value: 26, label: '20', icon: Images.d30_26),
    DiceFace(value: 27, label: '20', icon: Images.d30_27),
    DiceFace(value: 28, label: '20', icon: Images.d30_28),
    DiceFace(value: 29, label: '20', icon: Images.d30_29),
    DiceFace(value: 30, label: '20', icon: Images.d30_30),
  ],
);
