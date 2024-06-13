import 'package:flutter/material.dart';
import '../../svg_icon.dart';

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
  icon: SVGIcon.placeholder,
  label: 'Ability',
  color: Colors.green,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '7', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '8', icon: SVGIcon.placeholder),
  ],
);

DiceType proficiency = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Proficiency',
  color: Colors.yellow,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
    DiceFace(value: 7, label: '7', icon: SVGIcon.placeholder),
    DiceFace(value: 8, label: '8', icon: SVGIcon.placeholder),
    DiceFace(value: 9, label: '9', icon: SVGIcon.placeholder),
    DiceFace(value: 10, label: '10', icon: SVGIcon.placeholder),
    DiceFace(value: 11, label: '11', icon: SVGIcon.placeholder),
    DiceFace(value: 12, label: '12', icon: SVGIcon.placeholder),
  ],
);

DiceType boost = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Boost',
  color: Colors.blue,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
  ],
);

DiceType difficulty = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Difficulty',
  color: Colors.purple,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
    DiceFace(value: 7, label: '7', icon: SVGIcon.placeholder),
    DiceFace(value: 8, label: '8', icon: SVGIcon.placeholder),
  ],
);

DiceType challenge = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Challenge',
  color: Colors.red,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
    DiceFace(value: 7, label: '7', icon: SVGIcon.placeholder),
    DiceFace(value: 8, label: '8', icon: SVGIcon.placeholder),
    DiceFace(value: 9, label: '9', icon: SVGIcon.placeholder),
    DiceFace(value: 10, label: '10', icon: SVGIcon.placeholder),
    DiceFace(value: 11, label: '11', icon: SVGIcon.placeholder),
    DiceFace(value: 12, label: '12', icon: SVGIcon.placeholder),
  ],
);

DiceType setback = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Setback',
  color: Colors.black,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
  ],
);

DiceType force = DiceType(
  icon: SVGIcon.placeholder,
  label: 'Force',
  color: Colors.white,
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
  ],
);

DiceType percentile = DiceType(
  icon: SVGIcon.placeholder,
  label: '%',
  faces: [
    DiceFace(value: 1, label: '1', icon: SVGIcon.placeholder),
    DiceFace(value: 2, label: '2', icon: SVGIcon.placeholder),
    DiceFace(value: 3, label: '3', icon: SVGIcon.placeholder),
    DiceFace(value: 4, label: '4', icon: SVGIcon.placeholder),
    DiceFace(value: 5, label: '5', icon: SVGIcon.placeholder),
    DiceFace(value: 6, label: '6', icon: SVGIcon.placeholder),
  ],
);
