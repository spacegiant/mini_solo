import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../views/journal_view.dart';
import 'app_state.dart';

ReturnObject testScene(BuildContext context) {
  int d10 = Random().nextInt(10) + 1;
  var chaosFactor = context.read<AppState>().chaosFactor;

  if (d10 > chaosFactor) {
    return ReturnObject(
      line1: 'Expected',
      line3: 'd10 roll = $d10 > CF $chaosFactor',
      type: 'test',
    );
  }
  if (d10.isEven) {
    return ReturnObject(
      line1: 'Altered',
      line3: 'd10 roll = $d10 (Odd) < CF $chaosFactor',
      type: 'test',
    );
  } else {
    return ReturnObject(
      line1: 'Interrupt',
      line3: 'd10 roll = $d10 (Even) < CF $chaosFactor',
      type: 'test',
    );
  }
}
