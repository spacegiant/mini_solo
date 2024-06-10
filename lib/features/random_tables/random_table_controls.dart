import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/features/random_tables/roll_table.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../data/app_state.dart';

class RandomTables extends StatelessWidget {
  const RandomTables({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    List<RandomTableEntry> randomTables = appState.randomTables;
    return WrapManager(
      wrapControls: appState.wrapControls,
      children: [
        ...randomTables.map(
          (table) => ListButton(
            label: table.title,
            onPressed: () {
              RollTableResult? result = rollTable(table);
              appState.addRandomTableResultsEntry(result!);
            },
            onLongPress: () {
              appState.setCurrentEntryId(table.id);
              appState.toggleShowPopup(
                label: PopupLabel.editRandomTable,
              );
            },
          ),
        ),
        ListButton(
          iconData: CupertinoIcons.add,
          onPressed: () {
            appState.toggleShowPopup(
              label: PopupLabel.addRandomTable,
            );
          },
          label: 'Add random table',
        ),
      ],
    );
  }
}
