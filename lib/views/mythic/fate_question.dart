import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/list_button.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../journal/journal_controls.dart';
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

List<ControlData> mythicFateChartControls2 = [
  for (var row in fateChart)
    ControlData(
        controlId: 'control-${row.label}',
        label: row.label,
        fateChartRow: row,
        controlType: ControlTypeEnum.mythicChart)
];

List<String> mythicFateChartIds = [
  for (var row in fateChart) 'control-${row.label}'
];

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
  FateChartRow? fateChartRow,
  AppState appState,
) {
  if (fateChartRow == null) return;
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
