import 'package:flutter/cupertino.dart';

import 'fate_question.dart';

FateChartRow certain = FateChartRow(
  'Certain',
  CupertinoColors.systemGreen,
  [
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
    OddsValue(18, 90, 99),
    OddsValue(19, 95, 100),
    OddsValue(20, 99, null),
    OddsValue(20, 99, null),
    OddsValue(20, 99, null),
  ],
);

FateChartRow nearlyCertain = FateChartRow(
  'Nearly Certain',
  CupertinoColors.systemGreen,
  [
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
    OddsValue(18, 90, 99),
    OddsValue(19, 95, 100),
    OddsValue(20, 99, null),
    OddsValue(20, 99, null),
  ],
);

FateChartRow veryLikely = FateChartRow(
  'Very Likely',
  CupertinoColors.systemGreen,
  [
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
    OddsValue(18, 90, 99),
    OddsValue(19, 95, 100),
    OddsValue(20, 99, null),
  ],
);

FateChartRow likely = FateChartRow(
  'Likely',
  CupertinoColors.systemGreen,
  [
    OddsValue(3, 15, 84),
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
    OddsValue(18, 90, 99),
    OddsValue(19, 95, 100),
  ],
);

FateChartRow fiftyFifty = FateChartRow(
  '50/50',
  CupertinoColors.systemGrey,
  [
    OddsValue(2, 10, 83),
    OddsValue(3, 15, 84),
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
    OddsValue(18, 90, 99),
  ],
);

FateChartRow unlikely = FateChartRow(
  'Unlikely',
  CupertinoColors.systemRed,
  [
    OddsValue(1, 5, 82),
    OddsValue(2, 10, 83),
    OddsValue(3, 15, 84),
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
    OddsValue(17, 85, 98),
  ],
);

FateChartRow veryUnlikely = FateChartRow(
  'Very Unlikely',
  CupertinoColors.systemRed,
  [
    OddsValue(null, 1, 81),
    OddsValue(1, 5, 82),
    OddsValue(2, 10, 83),
    OddsValue(3, 15, 84),
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
    OddsValue(13, 65, 94),
    OddsValue(15, 75, 96),
  ],
);

FateChartRow nearlyImpossible = FateChartRow(
  'Nearly Impossible',
  CupertinoColors.systemRed,
  [
    OddsValue(null, 1, 81),
    OddsValue(null, 1, 81),
    OddsValue(1, 5, 81),
    OddsValue(2, 10, 82),
    OddsValue(3, 15, 83),
    OddsValue(5, 25, 84),
    OddsValue(7, 35, 86),
    OddsValue(10, 50, 88),
    OddsValue(13, 65, 91),
  ],
);

FateChartRow impossible = FateChartRow(
  'Impossible',
  CupertinoColors.systemRed,
  [
    OddsValue(null, 1, 81),
    OddsValue(null, 1, 81),
    OddsValue(null, 1, 81),
    OddsValue(1, 5, 82),
    OddsValue(2, 10, 83),
    OddsValue(3, 15, 84),
    OddsValue(5, 25, 86),
    OddsValue(7, 35, 88),
    OddsValue(10, 50, 91),
  ],
);

List<FateChartRow> fateChart = [
  certain,
  nearlyCertain,
  veryLikely,
  likely,
  fiftyFifty,
  unlikely,
  veryUnlikely,
  nearlyImpossible,
  impossible,
];
