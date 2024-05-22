import 'dart:math';

// TODO: COMPLETE FATE DICE - NEEDS 4 ROLLS AND A TOTAL
import 'dice.dart';

// DiceSet fateDice = DiceSet(
//   dieTypes: [d4, d6, d8, d10, d12, d20, d100],
//   label: 'Regular Dice Set',
// );

class FateGroupResult {
  int total;
  List<DiceFace> rolls;

  FateGroupResult({
    required this.total,
    required this.rolls,
  });
}

class FateDiceSet extends DiceSet {
  FateDiceSet({
    required super.dieTypes,
    required super.label,
    required this.faces,
  });

  List<DiceFace> faces;

  FateGroupResult rollGroup() {
    int total = 0;
    int numberOfSides = faces.length;
    int roll1 = Random().nextInt(numberOfSides) + 1;
    int roll2 = Random().nextInt(numberOfSides) + 1;
    int roll3 = Random().nextInt(numberOfSides) + 1;
    int roll4 = Random().nextInt(numberOfSides) + 1;

    List<DiceFace> myRolls = [
      fateDiceFaces[roll1],
      fateDiceFaces[roll2],
      fateDiceFaces[roll3],
      fateDiceFaces[roll4],
    ];

    for (var element in myRolls) {
      total += element.value;
    }
    return FateGroupResult(
      total: total,
      rolls: myRolls,
    );
  }
}

FateDiceSet fateDiceSet = FateDiceSet(
  dieTypes: [dF],
  label: 'Fate Dice',
  faces: fateDiceFaces,
);

DiceType dF = DiceType(label: '4dF', faces: fateDiceFaces);

List<DiceFace> fateDiceFaces = [
  DiceFace(value: 1, label: '+'),
  DiceFace(value: 0, label: ''),
  DiceFace(value: -1, label: '-'),
];
