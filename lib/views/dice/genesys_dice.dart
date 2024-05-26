import 'package:flutter/material.dart';

import 'dice.dart';

DiceSet genesysDice = DiceSet(
  dieTypes: [ability, proficiency, boost, difficulty, challenge, setback],
  label: 'Genesys Dice Set',
);

DiceSet ffgStarWars = DiceSet(
  dieTypes: [
    ability,
    proficiency,
    boost,
    force,
    difficulty,
    challenge,
    setback
  ],
  label: 'FF Star Wars Dice Set',
);

DiceType ability = DiceType(
  label: 'Ability',
  color: Colors.green,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
    DiceFace(value: 6, label: '7'),
    DiceFace(value: 6, label: '8'),
  ],
);

DiceType proficiency = DiceType(
  label: 'Proficiency',
  color: Colors.yellow,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
    DiceFace(value: 7, label: '7'),
    DiceFace(value: 8, label: '8'),
    DiceFace(value: 9, label: '9'),
    DiceFace(value: 10, label: '10'),
    DiceFace(value: 11, label: '11'),
    DiceFace(value: 12, label: '12'),
  ],
);

DiceType boost = DiceType(
  label: 'Boost',
  color: Colors.blue,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
  ],
);

DiceType difficulty = DiceType(
  label: 'Difficulty',
  color: Colors.purple,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
    DiceFace(value: 7, label: '7'),
    DiceFace(value: 8, label: '8'),
  ],
);

DiceType challenge = DiceType(
  label: 'Challenge',
  color: Colors.red,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
    DiceFace(value: 7, label: '7'),
    DiceFace(value: 8, label: '8'),
    DiceFace(value: 9, label: '9'),
    DiceFace(value: 10, label: '10'),
    DiceFace(value: 11, label: '11'),
    DiceFace(value: 12, label: '12'),
  ],
);

DiceType setback = DiceType(
  label: 'Setback',
  color: Colors.black,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
  ],
);

DiceType force = DiceType(
  label: 'Force',
  color: Colors.white,
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
  ],
);

DiceType percentile = DiceType(
  label: '%',
  faces: [
    DiceFace(value: 1, label: '1'),
    DiceFace(value: 2, label: '2'),
    DiceFace(value: 3, label: '3'),
    DiceFace(value: 4, label: '4'),
    DiceFace(value: 5, label: '5'),
    DiceFace(value: 6, label: '6'),
  ],
);
