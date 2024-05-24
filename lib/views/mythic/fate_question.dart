import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:provider/provider.dart';

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

class FateQuestion extends StatelessWidget {
  const FateQuestion({
    super.key,
    required this.callback,
    required this.wrapControls,
  });

  final Function callback;
  final bool wrapControls;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
        builder: (BuildContext context, AppState appState, Widget? child) {
      return Column(
        children: [
          WrapManager(
            wrapControls: wrapControls,
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
                          result: 'Oracles says $answer');
                      callback(result);
                    },
                  ),
                )
                .toList(),
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
        horizontal: 0.0,
        vertical: 4.0,
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
