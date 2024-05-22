import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';

class OddsValue {
  final int? extremeYesValue;
  final int yesValue;
  final int? extremeNoValue;

  OddsValue(
    this.extremeYesValue,
    this.yesValue,
    this.extremeNoValue,
  );
}

class FateChartRow {
  final String label;
  final CupertinoDynamicColor color;
  final List<OddsValue> row;

  FateChartRow(
    this.label,
    this.color,
    this.row,
  );
}

class FateQuestion extends StatelessWidget {
  const FateQuestion({
    super.key,
    required this.callback,
  });

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
        builder: (BuildContext context, AppState appState, Widget? child) {
      return Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          //   child: Text('Fate Question'),
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: fateChart
                  .map<Widget>(
                    (widget) => ToolbarButton(
                      label: widget.label,
                      color: widget.color,
                      onPressed: () {
                        OddsValue row = widget.row[appState.chaosFactor - 1];
                        int random = Random().nextInt(100) + 1;
                        String answer;
                        if (random > row.extremeNoValue!.toInt()) {
                          answer = 'EXTREME NO';
                        } else if (random < row.extremeYesValue!.toInt()) {
                          answer = 'EXTREME YES';
                        } else if (random <= row.yesValue.toInt()) {
                          answer = 'YES';
                        } else {
                          answer = 'NO';
                        }

                        ReturnObject result = ReturnObject(
                            type: 'fateChart',
                            line1:
                                'FateChart (Chaos Factor ${appState.chaosFactor})',
                            line2: 'd100 → $random',
                            line3: 'Oracles says $answer');
                        callback(result);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}

class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final CupertinoDynamicColor color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 1.0,
        vertical: 10.0,
      ),
      child: CupertinoButton(
        color: color,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

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
