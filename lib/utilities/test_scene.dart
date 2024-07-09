import 'dart:math';

import '../data/campaign_data.dart';
import '../data/app_state.dart';

JournalEntry testScene(AppState appState) {
  int d10 = Random().nextInt(10) + 1;
  var chaosFactor = appState.chaosFactor;

  if (d10 > chaosFactor) {
    return JournalEntry(
      result: 'Expected',
      line1: 'd10 roll = $d10 > CF $chaosFactor',
      type: 'test',
    );
  }
  if (d10.isEven) {
    return JournalEntry(
      result: 'Altered',
      line1: 'd10 roll = $d10 (Odd) < CF $chaosFactor',
      type: 'test',
    );
  } else {
    return JournalEntry(
      result: 'Interrupt',
      line1: 'd10 roll = $d10 (Even) < CF $chaosFactor',
      type: 'test',
    );
  }
}
