import 'package:flutter/cupertino.dart';

import '../../svg_icon.dart';
import '../../widgets/list_button.dart';
import '../dice/dice_button.dart';
import '../dice/other_dice_sets.dart';
import 'journal_controls.dart';

enum ControlType {
  button,
  dice,
  diceGroup,
  // TRACKER TYPES
  clock4,
  clock6,
  clock8,
  bar,
  ironsworn1Troublesome,
  ironsworn2Dangerous,
  ironsworn3Formidable,
  ironsworn4Extreme,
  ironsworn5Epic,
  pips,
  value,
  counter,
  fate_aspect,
}

Widget chooseControlWidget(ControlData controlData) {
  if (controlData.controlType == ControlType.button) {
    return ListButton(
      label: controlData.label,
      onPressed: () {},
    );
  } else if (controlData.controlType == ControlType.dice) {
    return DiceButton(
      dieType: d6oracle,
      label: 'D6 Oracle',
      icon: SVGIcon.d6Oracle,
      onPressed: (value) {},
    );
  } else {
    return Text(controlData.label);
  }
}
