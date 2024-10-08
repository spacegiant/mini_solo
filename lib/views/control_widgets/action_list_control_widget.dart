import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../data/result_entries.dart';
import '../../data/result_entry.dart';
import '../../features/action_lists/add_action_list_popup.dart';
import '../../features/random_tables/recursive_random_table_roll.dart';
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
      label: Text(controlData.label),
      iconData: CupertinoIcons.rocket_fill,
      onPressed: () {
        ResultEntriesCollection resultEntries =
            ResultEntriesCollection(list: [], title: controlData.label);

        recursiveActionListRoll(
          actionListId: controlData.controlId,
          handleResult: (resultEntry) {
            resultEntries.list.add(resultEntry);
          },
        );

        // print('----------------------');
        // for (var item in resultEntries.list) {
        //   print(item.title);
        // }

        appState.addResultEntry(ResultEntriesCollection(
            title: controlData.label, list: resultEntries.list));
      },
      onLongPress: () {
        toggleShowPopup(
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

  recursiveActionListRoll({
    int? recursionLimit,
    required String actionListId,
    required Function(ResultEntry) handleResult,
  }) {
    if (recursionLimit == 0) return;

    int myRecursionLimit = recursionLimit ??
        appState.campaignData!.settings.general.randomTableRecursionLimit;

    void runAction({
      int? recursionLimit,
      required String id,
    }) {
      ActionListEntry? actionListEntry = appState.actionLists
          .firstWhereOrNull((actionList) => actionList.id == id);

      if (actionListEntry == null) return;

      for (ActionRow row in actionListEntry.list) {
        switch (row.type) {
          case ActionEditorType.label:
            // print('LABEL');
            handleResult(
                ResultEntry(title: row.string, type: ResultEntryTypes.label));
            break;
          case ActionEditorType.randomTable:
            // print('RANDOM LIST');
            recursiveRandomTableRoll(
              recursionLimit: myRecursionLimit,
              randomTables: appState.randomTables,
              randomTableId: row.string,
              cb: (RollTableResult result) {
                handleResult(ResultEntry(
                    title: result.resultString,
                    type: ResultEntryTypes.randomTable,
                    detail: result.detail));
              },
            );
            break;
          case ActionEditorType.actionList:
            // print('ACTION LIST');

            runAction(
              recursionLimit: myRecursionLimit--,
              id: row.string,
            );
            break;
          default:
            break;
        }
      }
    }

    runAction(recursionLimit: myRecursionLimit, id: actionListId);
  }
}
