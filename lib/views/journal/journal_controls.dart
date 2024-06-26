import 'package:flutter/material.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/gap.dart';
import '../../widgets/view_wrapper.dart';
import 'control_data.dart';
import 'dice_journal_controls.dart';
import 'dynamic_list_of_controls.dart';
import 'get_control_data.dart';

Widget journalControls(
  AppState appState,
  void Function(List<DiceRoll> result) addResult,
  BuildContext context,
) {
  List<ControlData> controlData = getControlData(appState);

  return ViewWrapper(children: [
    diceJournalControls(appState, addResult, context),
    ...dynamicListOfControls(appState, controlData, context),
    const Gap(),

    // const MarkdownBlock(
    //   newString: '# hello\n*hello* hello\n- hello',
    // ),
  ]);
}
