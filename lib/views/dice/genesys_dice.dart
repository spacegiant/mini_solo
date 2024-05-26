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
  ],
);

DiceType proficiency = DiceType(
  label: 'Proficiency',
  color: Colors.yellow,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType boost = DiceType(
  label: 'Boost',
  color: Colors.blue,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType difficulty = DiceType(
  label: 'Difficulty',
  color: Colors.purple,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType challenge = DiceType(
  label: 'Challenge',
  color: Colors.red,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType setback = DiceType(
  label: 'Setback',
  color: Colors.black,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType force = DiceType(
  label: 'Force',
  color: Colors.white,
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);

DiceType percentile = DiceType(
  label: '%',
  faces: [
    DiceFace(value: 1, label: '1'),
  ],
);
