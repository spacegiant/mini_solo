import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:mini_solo/widgets/list_button.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../data/data_structures/journal_entry.dart';
import '../../data/data_structures/oracle_entry.dart';
import '../../features/grouping/group.dart';
import '../../features/mythic_gme/initial_mythic_gme_controls.dart';
import '../journal/control_data.dart';
import 'mythic_chart.dart';

class OddsValue {
  final int extremeYesValue;
  final int yesValue;
  final int extremeNoValue;

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

List<ControlData> mythicFateChartControls2(AppState appState) {
  List<FateChartRow> sortedRows = [];
  Group fateChartGroup = appState.getGroup('group-mythic-fate-chart');

  for (String control in fateChartGroup.controlsIDs) {
    FateChartRow row =
        fateChart.firstWhere((label) => 'control-${label.label}' == control);
    sortedRows.add(row);
  }

  return [
    for (var row in sortedRows)
      ControlData(
          controlId: 'control-${row.label}',
          label: row.label,
          fateChartRow: row,
          controlType: ControlTypeEnum.mythicChart)
  ];
}

List<ControlData> mythicGMEControls(AppState appState) {
  List<ControlData> list = [];
  Group mythicGMEGroup = appState.getGroup('group-mythic-gme');

  for (String label in mythicGMEGroup.controlsIDs) {
    ControlData controlData =
        initialMythicGMEControls.firstWhere((data) => data.controlId == label);

    list.add(controlData);
  }

  return list;
}

List<String> initialMythicFateChartIds = [
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
      label: Text(fateChartRow.label),
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
  if (random > row.extremeNoValue.toInt()) {
    answer = 'EXTREME NO';
  } else if (random < row.extremeYesValue.toInt()) {
    answer = 'EXTREME YES';
  } else if (random <= row.yesValue.toInt()) {
    answer = 'YES';
  } else {
    answer = 'NO';
  }

  JournalEntry result = JournalEntry(
    type: 'fateChart',
    line1: '${fateChartRow.label} odds, Chaos Factor ${appState.chaosFactor}',
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
