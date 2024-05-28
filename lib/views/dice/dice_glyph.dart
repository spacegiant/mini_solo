import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/icons.dart';

import '../../data/campaign_data.dart';

class DiceGlyph extends StatelessWidget {
  const DiceGlyph({
    super.key,
    required this.diceRoll,
    required this.dieType,
  });

  final DiceRoll diceRoll;
  final String dieType;

  @override
  Widget build(BuildContext context) {
    double circleWidth = 50.0;
    Widget glyphContent;

    glyphContent = Column(children: [
      SvgIcon(icon: diceRoll.icon),
      Text(
        diceRoll.diceType,
        style: const TextStyle(
          fontSize: 12.0,
        ),
      )
    ]);
  
    return glyphContent;
  }
}
