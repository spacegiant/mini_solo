import 'package:flutter/material.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/view_wrapper.dart';
import 'control_data.dart';
import 'dice_tray.dart';
import 'dynamic_list_of_controls.dart';
import 'get_control_data.dart';
import 'group_container.dart';

Widget journalControls(
  AppState appState,
  void Function(List<DiceRoll> result) addResult,
  BuildContext context,
) {
  List<ControlData> controlData = getControlData(appState);

  return ViewWrapper(children: [
    // ...diceControls(addResult).values,
    GroupContainer(
        label: 'Dice',
        containerId: 'group-dice',
        appState: appState,
        showDivider: false,
        groupId: 'group-dice',
        handleLongPress: () {},
        children: [
          diceTray(
            appState,
            addResult,
          ),
        ]),
    ...dynamicListOfControls(appState, controlData, context),

    // const MarkdownBlock(
    //   newString: '# hello\n*hello* hello\n- hello',
    // ),
  ]);
}
