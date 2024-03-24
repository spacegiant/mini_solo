import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/output.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/gap.dart';

class DieType {
  late Color? color;
  late String label;
  late List<DiceFace> faces;

  DieType({
    this.color,
    required this.label,
    required this.faces,
  });

  int roll() {
    int numberOfSides = faces.length;
    int randomRoll = Random().nextInt(numberOfSides) + 1;
    return randomRoll;
  }
}

class DiceFace {
  late int value;
  late String? label;
  late Icon? icon;

  DiceFace({
    required this.value,
    this.label,
    this.icon,
  });
}

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

List<DiceFace> createDice(int numberOfSides) {
  return List.generate(numberOfSides,
      (index) => DiceFace(value: index, label: index.toString()));
}

class DiceSet {
  List<DieType> dieTypes;
  String label;

  DiceSet({
    required this.dieTypes,
    required this.label,
  });
}

DiceSet regularDice = DiceSet(
  dieTypes: [d4, d6, d8, d10, d12, d20, d100],
  label: 'Regular Dice Set',
);

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(
      children: [
        Output(line1: '...'),
        DiceCollection(),
        Gap(),
        DiceCollection(),
        Gap(),
        Text('Traditional dice'),
        Text('Zocchi dice'),
        Text('Genesys dice'),
        Text('Story dice'),
      ],
    );
  }
}

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable diceButtons = regularDice.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
        ));

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3.0,
            color: CupertinoColors.systemRed,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          const Text('Traditional Set'),
          const Gap(),
          Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [...diceButtons],
          ),
        ],
      ),
    );
  }
}

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.dieType,
  });

  final DieType dieType;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: CupertinoColors.systemPink,
        padding: const EdgeInsets.all(0.0),
        child: Text(
          dieType.label,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        onPressed: () {
          int roll = dieType.roll();
        });
  }
}
