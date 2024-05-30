import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/campaign_data.dart';
import '../data/app_state.dart';

JournalReturnObject testScene(BuildContext context) {
  int d10 = Random().nextInt(10) + 1;
  var chaosFactor = context.read<AppState>().chaosFactor;

  if (d10 > chaosFactor) {
    return JournalReturnObject(
      result: 'Expected',
      line1: 'd10 roll = $d10 > CF $chaosFactor',
      type: 'test',
    );
  }
  if (d10.isEven) {
    return JournalReturnObject(
      result: 'Altered',
      line1: 'd10 roll = $d10 (Odd) < CF $chaosFactor',
      type: 'test',
    );
  } else {
    return JournalReturnObject(
      result: 'Interrupt',
      line1: 'd10 roll = $d10 (Even) < CF $chaosFactor',
      type: 'test',
    );
  }
}
