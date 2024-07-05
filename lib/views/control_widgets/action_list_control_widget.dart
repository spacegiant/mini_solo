import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../features/action_lists/add_action_list_popup.dart';
import '../../features/action_lists/recursive_action_list_roll.dart';
import '../../widgets/list_button.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import '../journal/control_data.dart';

class ActionListControlWidget extends StatelessWidget {
  const ActionListControlWidget({
    super.key,
    required this.controlData,
    required this.buttonColor,
    required this.appState,
  });

  final ControlData controlData;
  final Color buttonColor;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ListButton(
      color: buttonColor,
      label: controlData.label,
      iconData: CupertinoIcons.rocket_fill,
      onPressed: () {
        runAction();
      },
      onLongPress: () {
        toggleShowPopup2(
          maxWidth: 400.0,
          maxHeight: 800.0,
          child: AddActionListPopup(
            appState: appState,
            id: controlData.controlId,
          ),
          context: context,
        );
      },
    );
  }

  void runAction() {
    ResultEntries resultEntries = ResultEntries(list: []);

    ActionListEntry? entry = controlData.actionList;
    List<ActionRow> actionRows = entry!.list;
    for (ActionRow row in actionRows) {
      switch (row.type) {
        case ActionEditorType.label:
          resultEntries.list.add(LabelResultEntry(title: row.string));
          break;
        case ActionEditorType.randomTable:
          recursiveRandomTableRoll(
            recursionLimit: appState
                    .campaignData?.settings.general.randomTableRecursionLimit ??
                3,
            randomTables: appState.randomTables,
            randomTableId: row.string,
            cb: (RollTableResult result) {
              resultEntries.list
                  .add(RandomTableResultEntry(title: result.resultString));
            },
          );
          break;
        case ActionEditorType.actionList:
          resultEntries.list.add(ActionListResultEntry(title: row.string));
          // runRunActionAgain();
          break;
        default:
          break;
      }
    }
    // TODO when for loop finished publish results
    // Add to journal
    for (var entry in resultEntries.list) {
      print(entry.title);
    }
  }
}
