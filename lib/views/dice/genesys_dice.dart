import 'package:flutter/material.dart';
import '../../icons.dart';

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
  icon: Images.placeholder,
  label: 'Ability',
  color: Colors.green,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
    DiceFace(value: 6, label: '7', icon: Images.placeholder),
    DiceFace(value: 6, label: '8', icon: Images.placeholder),
  ],
);

DiceType proficiency = DiceType(
  icon: Images.placeholder,
  label: 'Proficiency',
  color: Colors.yellow,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
    DiceFace(value: 7, label: '7', icon: Images.placeholder),
    DiceFace(value: 8, label: '8', icon: Images.placeholder),
    DiceFace(value: 9, label: '9', icon: Images.placeholder),
    DiceFace(value: 10, label: '10', icon: Images.placeholder),
    DiceFace(value: 11, label: '11', icon: Images.placeholder),
    DiceFace(value: 12, label: '12', icon: Images.placeholder),
  ],
);

DiceType boost = DiceType(
  icon: Images.placeholder,
  label: 'Boost',
  color: Colors.blue,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
  ],
);

DiceType difficulty = DiceType(
  icon: Images.placeholder,
  label: 'Difficulty',
  color: Colors.purple,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
    DiceFace(value: 7, label: '7', icon: Images.placeholder),
    DiceFace(value: 8, label: '8', icon: Images.placeholder),
  ],
);

DiceType challenge = DiceType(
  icon: Images.placeholder,
  label: 'Challenge',
  color: Colors.red,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
    DiceFace(value: 7, label: '7', icon: Images.placeholder),
    DiceFace(value: 8, label: '8', icon: Images.placeholder),
    DiceFace(value: 9, label: '9', icon: Images.placeholder),
    DiceFace(value: 10, label: '10', icon: Images.placeholder),
    DiceFace(value: 11, label: '11', icon: Images.placeholder),
    DiceFace(value: 12, label: '12', icon: Images.placeholder),
  ],
);

DiceType setback = DiceType(
  icon: Images.placeholder,
  label: 'Setback',
  color: Colors.black,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
  ],
);

DiceType force = DiceType(
  icon: Images.placeholder,
  label: 'Force',
  color: Colors.white,
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
  ],
);

DiceType percentile = DiceType(
  icon: Images.placeholder,
  label: '%',
  faces: [
    DiceFace(value: 1, label: '1', icon: Images.placeholder),
    DiceFace(value: 2, label: '2', icon: Images.placeholder),
    DiceFace(value: 3, label: '3', icon: Images.placeholder),
    DiceFace(value: 4, label: '4', icon: Images.placeholder),
    DiceFace(value: 5, label: '5', icon: Images.placeholder),
    DiceFace(value: 6, label: '6', icon: Images.placeholder),
  ],
);
