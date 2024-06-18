import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../widgets/wrap_manager.dart';
import 'mythic_chart.dart';

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

Map<String, Widget> mythicFateChartControls(
  AppState appState,
) =>
    {
      for (var row in fateChart)
        row.label: FateChartListButton(
          fateChartRow: row,
          appState: appState,
        ),
    };

class FateChartListButton extends StatelessWidget {
  const FateChartListButton({
    super.key,
    required this.fateChartRow,
    required this.appState,
  });

  final FateChartRow fateChartRow;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ListButton(
      label: fateChartRow.label,
      color: fateChartRow.color,
      onPressed: () {
        fateChartControlOnPressed(fateChartRow, appState);
      },
    );
  }
}

fateChartControlOnPressed(
  FateChartRow fateChartRow,
  AppState appState,
) {
  OddsValue row = fateChartRow.row[appState.chaosFactor - 1];
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

  JournalReturnObject result = JournalReturnObject(
    type: 'fateChart',
    line1: '${fateChartRow.label} odds | Chaos Factor ${appState.chaosFactor}',
    line2: 'd100 → $random',
    result: 'Oracles says $answer',
  );

  appState.addOracleEntry(
    OracleEntry(
      isFavourite: false,
      lines: result,
      label: kJournalMythicAskTheFateChart,
    ),
  );
}
